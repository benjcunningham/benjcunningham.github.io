Jekyll::Hooks.register :site, :pre_render do |site, payload|
    `make all`
end
