// Copyright (c) Facebook, Inc. and its affiliates.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the "hack" directory of this source tree.

use anyhow::Result;
use hhbc::Attribute;
use hhbc::Body;
use hhbc::Class;
use hhbc::Constant;
use hhbc::Fatal;
use hhbc::Function;
use hhbc::Method;
use hhbc::Module;
use hhbc::Param;
use hhbc::ParamEntry;
use hhbc::SymbolRefs;
use hhbc::TypeConstant;
use hhbc::TypedValue;
use hhbc::Typedef;
use hhbc::Unit;

use crate::code_path::CodePath;
use crate::helpers::*;

/// Compare two hhbc::Units semantically.
///
/// For a semantic comparison we don't care about any bytecode differences as
/// long as:
///
///   1. Instructs with side-effects exist and are in the same order.
///
///   2. Instructs that can mutate COW datatypes (dict, vec, keyset, string)
///      have the same COW behavior (if a datatype would have been mutated in-place
///      in a_unit it should be mutated in-place in b_unit).
///
///   3. An exception thrown from an instruction will be handled the same way
///
/// In general most of the hhbc::Unit is compared using Eq - although structs are
/// destructured so an error can report where the difference occurred.
///
/// The "interesting" bit happens in `body::compare_bodies()`.
pub fn sem_diff_unit(a_unit: &Unit, b_unit: &Unit) -> Result<()> {
    let Unit {
        functions: a_functions,
        classes: a_classes,
        modules: a_modules,
        typedefs: a_typedefs,
        file_attributes: a_file_attributes,
        module_use: a_module_use,
        symbol_refs: a_symbol_refs,
        constants: a_constants,
        fatal: a_fatal,
        error_symbols: _,
        missing_symbols: _,
    } = a_unit;
    let Unit {
        functions: b_functions,
        classes: b_classes,
        modules: b_modules,
        typedefs: b_typedefs,
        file_attributes: b_file_attributes,
        module_use: b_module_use,
        symbol_refs: b_symbol_refs,
        constants: b_constants,
        fatal: b_fatal,
        error_symbols: _,
        missing_symbols: _,
    } = b_unit;

    let path = CodePath::name("Unit");

    sem_diff_map_t(
        &path.qualified("typedefs"),
        a_typedefs,
        b_typedefs,
        sem_diff_typedef,
    )?;

    sem_diff_attributes(
        &path.qualified("file_attributes"),
        a_file_attributes,
        b_file_attributes,
    )?;

    sem_diff_option(
        &path.qualified("fatal"),
        a_fatal.as_ref().into_option(),
        b_fatal.as_ref().into_option(),
        sem_diff_fatal,
    )?;

    sem_diff_map_t(
        &path.qualified("constants"),
        a_constants,
        b_constants,
        sem_diff_constant,
    )?;

    sem_diff_symbol_refs(&path.qualified("symbol_refs"), a_symbol_refs, b_symbol_refs)?;

    sem_diff_map_t(
        &path.qualified("modules"),
        a_modules,
        b_modules,
        sem_diff_module,
    )?;

    sem_diff_option(
        &path.qualified("module_use"),
        a_module_use.as_ref().into_option(),
        b_module_use.as_ref().into_option(),
        sem_diff_eq,
    )?;

    sem_diff_map_t(
        &path.qualified("functions"),
        a_functions,
        b_functions,
        sem_diff_function,
    )?;

    sem_diff_map_t(
        &path.qualified("classes"),
        a_classes,
        b_classes,
        sem_diff_class,
    )?;

    Ok(())
}

fn sem_diff_attribute(path: &CodePath<'_>, a: &Attribute, b: &Attribute) -> Result<()> {
    let Attribute {
        name: a_name,
        arguments: a_arguments,
    } = a;
    let Attribute {
        name: b_name,
        arguments: b_arguments,
    } = b;
    sem_diff_eq(&path.qualified("name"), a_name, b_name)?;
    sem_diff_slice(
        &path.qualified("arguments"),
        a_arguments,
        b_arguments,
        sem_diff_eq,
    )?;
    Ok(())
}

fn sem_diff_attributes(path: &CodePath<'_>, a: &[Attribute], b: &[Attribute]) -> Result<()> {
    sem_diff_slice(path, a, b, sem_diff_attribute)
}

fn sem_diff_body(path: &CodePath<'_>, a: &Body, b: &Body) -> Result<()> {
    let Body {
        attributes: a_attributes,
        attrs: a_attrs,
        coeffects: a_coeffects,
        num_iters: a_num_iters,
        is_memoize_wrapper: a_is_memoize_wrapper,
        is_memoize_wrapper_lsb: a_is_memoize_wrapper_lsb,
        upper_bounds: a_upper_bounds,
        tparam_info: a_tparam_info,
        return_type: a_return_type,
        doc_comment: a_doc_comment,
        span: a_span,
        repr:
            hhbc::BcRepr {
                instrs: _,
                decl_vars: _,
                params: a_params,
                stack_depth: _,
            },
    } = a;
    let Body {
        attributes: b_attributes,
        attrs: b_attrs,
        coeffects: b_coeffects,
        num_iters: b_num_iters,
        is_memoize_wrapper: b_is_memoize_wrapper,
        is_memoize_wrapper_lsb: b_is_memoize_wrapper_lsb,
        upper_bounds: b_upper_bounds,
        tparam_info: b_tparam_info,
        return_type: b_return_type,
        doc_comment: b_doc_comment,
        span: b_span,
        repr:
            hhbc::BcRepr {
                instrs: _,
                decl_vars: _,
                params: b_params,
                stack_depth: _,
            },
    } = b;

    sem_diff_attributes(&path.qualified("attributes"), a_attributes, b_attributes)?;
    sem_diff_eq(&path.qualified("attrs"), a_attrs, b_attrs)?;
    sem_diff_eq(&path.qualified("coeffects"), a_coeffects, b_coeffects)?;
    sem_diff_eq(&path.qualified("num_iters"), a_num_iters, b_num_iters)?;
    sem_diff_slice(
        &path.qualified("params"),
        a_params,
        b_params,
        sem_diff_param,
    )?;
    sem_diff_eq(
        &path.qualified("is_memoize_wrapper"),
        a_is_memoize_wrapper,
        b_is_memoize_wrapper,
    )?;
    sem_diff_eq(
        &path.qualified("is_memoize_wrapper_lsb"),
        a_is_memoize_wrapper_lsb,
        b_is_memoize_wrapper_lsb,
    )?;
    sem_diff_eq(&path.qualified("doc_comment"), a_doc_comment, b_doc_comment)?;
    sem_diff_eq(&path.qualified("return_type"), a_return_type, b_return_type)?;
    sem_diff_eq(
        &path.qualified("upper_bounds"),
        a_upper_bounds,
        b_upper_bounds,
    )?;
    sem_diff_eq(&path.qualified("tparam_info"), a_tparam_info, b_tparam_info)?;
    sem_diff_eq(&path.qualified("span"), a_span, b_span)?;

    // Don't bother comparing decl_vars - when we use named vars later we'll
    // compare the names to ensure we're using the same ones.
    // sem_diff_set_t(&path.qualified("decl_vars"), a_decl_vars, b_decl_vars)?;

    // Don't bother comparing stack_depth - for a semantic compare it's fine for
    // them to be different.

    // This compares the instrs themselves.
    crate::body::compare_bodies(path, a, b)
}

fn sem_diff_param(path: &CodePath<'_>, a: &ParamEntry, b: &ParamEntry) -> Result<()> {
    let ParamEntry {
        param:
            Param {
                name: a_name,
                is_variadic: a_is_variadic,
                is_splat: a_is_splat,
                is_inout: a_is_inout,
                is_readonly: a_is_readonly,
                is_optional: a_is_optional,
                user_attributes: a_user_attributes,
                type_info: a_type_info,
            },
        dv: a_dv,
    } = a;
    let ParamEntry {
        param:
            Param {
                name: b_name,
                is_variadic: b_is_variadic,
                is_splat: b_is_splat,
                is_inout: b_is_inout,
                is_readonly: b_is_readonly,
                is_optional: b_is_optional,
                user_attributes: b_user_attributes,
                type_info: b_type_info,
            },
        dv: b_dv,
    } = b;

    sem_diff_eq(&path.qualified("name"), a_name, b_name)?;
    sem_diff_eq(&path.qualified("is_variadic"), a_is_variadic, b_is_variadic)?;
    sem_diff_eq(&path.qualified("is_splat"), a_is_splat, b_is_splat)?;
    sem_diff_eq(&path.qualified("is_inout"), a_is_inout, b_is_inout)?;
    sem_diff_eq(&path.qualified("is_readonly"), a_is_readonly, b_is_readonly)?;
    sem_diff_eq(&path.qualified("is_optional"), a_is_optional, b_is_optional)?;
    sem_diff_eq(
        &path.qualified("user_attributes"),
        a_user_attributes,
        b_user_attributes,
    )?;
    sem_diff_eq(&path.qualified("type_info"), a_type_info, b_type_info)?;
    sem_diff_option(
        &path.qualified("default_value"),
        a_dv.as_ref().into_option(),
        b_dv.as_ref().into_option(),
        |path, a, b| sem_diff_eq(path, &a.expr, &b.expr),
    )?;

    Ok(())
}

fn sem_diff_class(path: &CodePath<'_>, a: &Class, b: &Class) -> Result<()> {
    let Class {
        attributes: a_attributes,
        base: a_base,
        implements: a_implements,
        enum_includes: a_enum_includes,
        name: a_name,
        span: a_span,
        uses: a_uses,
        enum_type: a_enum_type,
        methods: a_methods,
        properties: a_properties,
        constants: a_constants,
        type_constants: a_type_constants,
        ctx_constants: a_ctx_constants,
        requirements: a_requirements,
        upper_bounds: a_upper_bounds,
        tparams: a_tparams,
        doc_comment: a_doc_comment,
        flags: a_flags,
    } = a;
    let Class {
        attributes: b_attributes,
        base: b_base,
        implements: b_implements,
        enum_includes: b_enum_includes,
        name: b_name,
        span: b_span,
        uses: b_uses,
        enum_type: b_enum_type,
        methods: b_methods,
        properties: b_properties,
        constants: b_constants,
        type_constants: b_type_constants,
        ctx_constants: b_ctx_constants,
        requirements: b_requirements,
        upper_bounds: b_upper_bounds,
        tparams: b_tparams,
        doc_comment: b_doc_comment,
        flags: b_flags,
    } = b;

    sem_diff_eq(&path.qualified("name"), a_name, b_name)?;
    sem_diff_attributes(&path.qualified("attributes"), a_attributes, b_attributes)?;
    sem_diff_eq(&path.qualified("base"), a_base, b_base)?;

    sem_diff_eq(&path.qualified("implements"), a_implements, b_implements)?;
    sem_diff_eq(
        &path.qualified("enum_includes"),
        a_enum_includes,
        b_enum_includes,
    )?;
    sem_diff_eq(&path.qualified("span"), a_span, b_span)?;
    sem_diff_eq(&path.qualified("uses"), a_uses, b_uses)?;
    sem_diff_option(
        &path.qualified("enum_type"),
        a_enum_type.as_ref().into_option(),
        b_enum_type.as_ref().into_option(),
        sem_diff_eq,
    )?;
    sem_diff_map_t(
        &path.qualified("properties"),
        a_properties,
        b_properties,
        sem_diff_eq,
    )?;
    sem_diff_map_t(
        &path.qualified("constants"),
        a_constants,
        b_constants,
        sem_diff_constant,
    )?;
    sem_diff_map_t(
        &path.qualified("type_constants"),
        a_type_constants,
        b_type_constants,
        sem_diff_type_constant,
    )?;
    sem_diff_map_t(
        &path.qualified("ctx_constants"),
        a_ctx_constants,
        b_ctx_constants,
        sem_diff_eq,
    )?;
    sem_diff_map_t(
        &path.qualified("requirements"),
        a_requirements,
        b_requirements,
        |path, a, b| sem_diff_eq(path, &a.kind, &b.kind),
    )?;
    sem_diff_map_t(
        &path.qualified("upper_bounds"),
        a_upper_bounds,
        b_upper_bounds,
        |path, a, b| sem_diff_slice(path, &a.bounds, &b.bounds, sem_diff_eq),
    )?;
    sem_diff_iter(
        &path.qualified("tparams"),
        a_tparams.iter(),
        b_tparams.iter(),
        sem_diff_eq,
    )?;
    sem_diff_eq(&path.qualified("doc_comment"), a_doc_comment, b_doc_comment)?;
    sem_diff_eq(&path.qualified("flags"), a_flags, b_flags)?;

    sem_diff_map_t(
        &path.qualified("methods"),
        a_methods,
        b_methods,
        sem_diff_method,
    )?;

    Ok(())
}

fn sem_diff_constant(path: &CodePath<'_>, a: &Constant, b: &Constant) -> Result<()> {
    let Constant {
        name: a_name,
        value: a_value,
        attrs: a_attrs,
    } = a;
    let Constant {
        name: b_name,
        value: b_value,
        attrs: b_attrs,
    } = b;
    sem_diff_eq(&path.qualified("name"), a_name, b_name)?;
    sem_diff_option(
        &path.qualified("value"),
        a_value.as_ref().into_option(),
        b_value.as_ref().into_option(),
        sem_diff_eq,
    )?;
    sem_diff_eq(&path.qualified("attrs"), a_attrs, b_attrs)?;
    Ok(())
}

fn sem_diff_type_constant(path: &CodePath<'_>, a: &TypeConstant, b: &TypeConstant) -> Result<()> {
    let TypeConstant {
        name: a_name,
        initializer: a_initializer,
        is_abstract: a_is_abstract,
    } = a;
    let TypeConstant {
        name: b_name,
        initializer: b_initializer,
        is_abstract: b_is_abstract,
    } = b;
    sem_diff_eq(&path.qualified("name"), a_name, b_name)?;
    sem_diff_option(
        &path.qualified("initializer"),
        a_initializer.as_ref().into_option(),
        b_initializer.as_ref().into_option(),
        sem_diff_typed_value,
    )?;
    sem_diff_eq(&path.qualified("is_abstract"), a_is_abstract, b_is_abstract)?;
    Ok(())
}

fn sem_diff_typed_value(path: &CodePath<'_>, a: &TypedValue, b: &TypedValue) -> Result<()> {
    match (a, b) {
        (TypedValue::Vec(av), TypedValue::Vec(bv)) => {
            sem_diff_iter(path, av.iter(), bv.iter(), sem_diff_typed_value)
        }
        (TypedValue::Keyset(ak), TypedValue::Keyset(bk)) => {
            // Because Keyset is represented as a Vec we
            // need to actually remove duplicate keys while we compare. The
            // order is based on the first occurance. The value is based on the
            // last occurance - this matches IndexSet::insert() (and thus
            // collect()).
            let ad: hash::IndexSet<&TypedValue> = ak.iter().collect();
            let bd: hash::IndexSet<&TypedValue> = bk.iter().collect();
            sem_diff_iter(
                path,
                ad.iter().copied(),
                bd.iter().copied(),
                sem_diff_typed_value,
            )
        }
        (TypedValue::Dict(ad), TypedValue::Dict(bd)) => {
            // Because Dict is represented as a Vec of (key, value) pairs we
            // need to actually remove duplicate keys while we compare. The
            // order is based on the first occurance. The value is based on the
            // last occurance - this matches IndexMap::insert() (and thus
            // collect()).
            let ad: hash::IndexMap<&TypedValue, &TypedValue> = ad
                .iter()
                .map(|hhbc::Entry { key, value }| (key, value))
                .collect();
            let bd: hash::IndexMap<&TypedValue, &TypedValue> = bd
                .iter()
                .map(|hhbc::Entry { key, value }| (key, value))
                .collect();
            sem_diff_iter(path, ad.iter(), bd.iter(), |path, a, b| {
                sem_diff_typed_value(path, a.0, b.0)?;
                sem_diff_typed_value(path, a.1, b.1)?;
                Ok(())
            })
        }
        _ => sem_diff_eq(path, a, b),
    }
}

fn sem_diff_fatal(path: &CodePath<'_>, a: &Fatal, b: &Fatal) -> Result<()> {
    sem_diff_eq(&path.index(0), &a.op, &b.op)?;
    sem_diff_eq(&path.index(1), &a.loc, &b.loc)?;
    sem_diff_eq(&path.index(2), &a.message, &b.message)?;
    Ok(())
}

fn sem_diff_function(path: &CodePath<'_>, a: &Function, b: &Function) -> Result<()> {
    let Function {
        name: a_name,
        body: a_body,
        flags: a_flags,
    } = a;
    let Function {
        name: b_name,
        body: b_body,
        flags: b_flags,
    } = b;

    sem_diff_eq(&path.qualified("name"), a_name, b_name)?;
    sem_diff_body(&path.qualified("body"), a_body, b_body)?;
    sem_diff_eq(&path.qualified("flags"), a_flags, b_flags)?;
    Ok(())
}

fn sem_diff_method(path: &CodePath<'_>, a: &Method, b: &Method) -> Result<()> {
    let Method {
        visibility: a_visibility,
        name: a_name,
        body: a_body,
        flags: a_flags,
    } = a;
    let Method {
        visibility: b_visibility,
        name: b_name,
        body: b_body,
        flags: b_flags,
    } = b;
    sem_diff_eq(&path.qualified("visibility"), a_visibility, b_visibility)?;
    sem_diff_eq(&path.qualified("name"), a_name, b_name)?;
    sem_diff_body(&path.qualified("body"), a_body, b_body)?;
    sem_diff_eq(&path.qualified("flags"), a_flags, b_flags)?;
    Ok(())
}

fn sem_diff_module(path: &CodePath<'_>, a: &Module, b: &Module) -> Result<()> {
    let Module {
        attributes: a_attributes,
        name: a_name,
        span: a_span,
        doc_comment: a_doc_comment,
    } = a;
    let Module {
        attributes: b_attributes,
        name: b_name,
        span: b_span,
        doc_comment: b_doc_comment,
    } = b;

    sem_diff_eq(&path.qualified("name"), a_name, b_name)?;
    sem_diff_attributes(&path.qualified("attributes"), a_attributes, b_attributes)?;
    sem_diff_eq(&path.qualified("span"), a_span, b_span)?;
    sem_diff_eq(&path.qualified("doc_comment"), a_doc_comment, b_doc_comment)?;
    Ok(())
}

fn sem_diff_symbol_refs(path: &CodePath<'_>, a: &SymbolRefs, b: &SymbolRefs) -> Result<()> {
    let SymbolRefs {
        includes: a_includes,
        constants: a_constants,
        functions: a_functions,
        classes: a_classes,
    } = a;
    let SymbolRefs {
        includes: b_includes,
        constants: b_constants,
        functions: b_functions,
        classes: b_classes,
    } = b;

    sem_diff_slice(
        &path.qualified("includes"),
        a_includes,
        b_includes,
        sem_diff_eq,
    )?;
    sem_diff_slice(
        &path.qualified("constants"),
        a_constants,
        b_constants,
        sem_diff_eq,
    )?;
    sem_diff_slice(
        &path.qualified("functions"),
        a_functions,
        b_functions,
        sem_diff_eq,
    )?;
    sem_diff_slice(
        &path.qualified("classes"),
        a_classes,
        b_classes,
        sem_diff_eq,
    )?;
    Ok(())
}

fn sem_diff_typedef(path: &CodePath<'_>, a: &Typedef, b: &Typedef) -> Result<()> {
    let Typedef {
        name: a_name,
        attributes: a_attributes,
        type_info_union: a_type_info_union,
        type_structure: a_type_structure,
        span: a_span,
        attrs: a_attrs,
        case_type: a_case_type,
    } = a;
    let Typedef {
        name: b_name,
        attributes: b_attributes,
        type_info_union: b_type_info_union,
        type_structure: b_type_structure,
        span: b_span,
        attrs: b_attrs,
        case_type: b_case_type,
    } = b;

    sem_diff_eq(&path.qualified("name"), a_name, b_name)?;
    sem_diff_attributes(&path.qualified("attributes"), a_attributes, b_attributes)?;
    sem_diff_eq(
        &path.qualified("type_info"),
        a_type_info_union,
        b_type_info_union,
    )?;
    sem_diff_eq(
        &path.qualified("type_structure"),
        a_type_structure,
        b_type_structure,
    )?;
    sem_diff_eq(&path.qualified("span"), a_span, b_span)?;
    sem_diff_eq(&path.qualified("attrs"), a_attrs, b_attrs)?;
    sem_diff_eq(&path.qualified("cast_type"), a_case_type, b_case_type)?;
    Ok(())
}
