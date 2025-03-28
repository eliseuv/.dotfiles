@doc raw"""
    ingredients(path::String)::Module

Pluto hack to use local modules.
https://github.com/fonsp/Pluto.jl/issues/115#issuecomment-661722426

# Usage:
```
Foo = ingredients("MyLib/Foo.jl").Foo
```

"""
function ingredients(path::String)
    # this is from the Julia source code (evalfile in base/loading.jl)
    # but with the modification that it returns the module instead of the last object
    name = Symbol(basename(path))
    m = Module(name)
    Core.eval(m,
        Expr(:toplevel,
            :(eval(x) = $(Expr(:core, :eval))($name, x)),
            :(include(x) = $(Expr(:top, :include))($name, x)),
            :(include(mapexpr::Function, x) = $(Expr(:top, :include))(mapexpr, $name, x)),
            :(include($path))))
    return m
end
