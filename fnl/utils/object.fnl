(fn keys [tbl]
  (var keys [])
  (each [k _ (ipairs tbl)]
    (table.insert keys k))
  keys)

(fn vals [tbl]
  (var val [])
  (each [_ v (ipairs tbl)]
    (table.insert val v))
  val)

{:keys keys 
 :values vals}
