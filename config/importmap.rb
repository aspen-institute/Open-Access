# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@editorjs/editorjs", to: "https://ga.jspm.io/npm:@editorjs/editorjs@2.23.2/dist/editor.js"
pin "@editorjs/list", to: "https://ga.jspm.io/npm:@editorjs/list@1.6.2/dist/bundle.js"
pin "@editorjs/header", to: "https://ga.jspm.io/npm:@editorjs/header@2.6.2/dist/bundle.js"
pin "@editorjs/embed", to: "https://ga.jspm.io/npm:@editorjs/embed@2.5.0/dist/bundle.js"
pin "@editorjs/delimiter", to: "https://ga.jspm.io/npm:@editorjs/delimiter@1.2.0/dist/bundle.js"
pin "@editorjs/image", to: "https://ga.jspm.io/npm:@editorjs/image@2.6.2/dist/bundle.js"
pin "@editorjs/link", to: "https://ga.jspm.io/npm:@editorjs/link@2.4.0/dist/bundle.js"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.1.3/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.2/lib/index.js"
pin "@editorjs/marker", to: "https://ga.jspm.io/npm:@editorjs/marker@1.2.2/dist/bundle.js"
pin "@editorjs/raw", to: "https://ga.jspm.io/npm:@editorjs/raw@2.3.0/dist/bundle.js"
pin "@editorjs/warning", to: "https://ga.jspm.io/npm:@editorjs/warning@1.2.0/dist/bundle.js"
pin "@editorjs/table", to: "https://ga.jspm.io/npm:@editorjs/table@2.0.1/dist/table.js"
pin "editorjs-alert", to: "https://ga.jspm.io/npm:editorjs-alert@1.0.3/dist/bundle.js"
pin "editorjs-text-alignment-blocktune", to: "https://ga.jspm.io/npm:editorjs-text-alignment-blocktune@1.0.3/dist/bundle.js"
pin "@editorjs/paragraph", to: "https://ga.jspm.io/npm:@editorjs/paragraph@2.8.0/dist/bundle.js"
