using InteractiveUtils

# Use neovim as editor
ENV["JULIA_EDITOR"] = "nvim"

InteractiveUtils.define_editor(
    r"nvim", wait=true) do cmd, path, line
    `$cmd +$line $path`
end

# Executed only for the REPL 
atreplinit() do repl
    # Load Revise.jl
    try
        @eval using Revise
    catch e
        @warn "Error initializing Revise" exception=(e, catch_backtrace())
    end
end
