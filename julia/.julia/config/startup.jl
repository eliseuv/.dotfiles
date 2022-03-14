# Executed only for the REPL 
atreplinit() do repl
    # Load Revise.jl
    try
        @eval using Revise
    catch e
        @warn "Error initializing Revise" exception=(e, catch_backtrace())
    end
end
