/// Adds an utf-8 header...? only ever used on circuitry so when wiremod arrives...
#define UTF8HEADER "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' /><meta http-equiv='X-UA-Compatible' content='IE=edge' />"
/// A shorthand for ternary operators to simulate a null-coalescing operator. Returns the first argument if its defined, otherwise, second.
#define NULL_COALESCE(var, default) (isnull(var) ? (default) : (var))
