Jekyll::Hooks.register :site, :pre_render do |doc, payload|
    `Rscript build.R`
end
