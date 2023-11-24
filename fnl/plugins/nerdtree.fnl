;scrooloose/nerdtree
(let [wk (require :which-key)]
  (wk.register {
     :f [":NERDTreeToggle<CR>" "NERDTree switcher"]
     }
    {
      :mode   "n"
      :prefix   "<leader>"
      :buffer   nil
      :silent  true
      :noremap   true
      :nowait   false
      :expr   false
    }))
