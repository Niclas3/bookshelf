(fn safe_get [func mode name]
  (local status (pcall func name))
  (when status
    (if (= mode :v)
        (func name))))

(fn min [arg1 arg2]
  (if (> arg1 arg2)
    arg2
    arg1))
(fn max [arg1 arg2]
  (if (< arg1 arg2)
    arg2
    arg1))

(fn extruct_row_col [pos]
  [(. pos 2) (. pos 3)])

(fn sort_row_cols [point1 point2]
  (let [po1_row (. point1 1)
        po1_col (. point1 2)
        po2_row (. point2 1)
        po2_col (. point2 2)]
    [(min po1_row po2_row)
    (min po1_col po2_col)
    (max po1_row po2_row)
    (max po1_col po2_col)]))

(fn v-select-str []
  (let [visual_pos (vim.fn.getpos "v")
        cur_pos (vim.fn.getpos :.)
        result_table (sort_row_cols (extruct_row_col visual_pos) (extruct_row_col cur_pos))
        s_row (. result_table 1)
        s_col (. result_table 2)
        e_row (. result_table 3)
        e_col (. result_table 4)]
    (let [str (vim.api.nvim_buf_get_text 0 (- s_row 1) (- s_col 1) (- e_row 1) (- e_col 0) {})]
      str)))
