

def quoi_est_le_poupee?(a, b)
  c = cette("poupee", "victorienne")
  d = maisette("poupee", "barbie")
  e = sinon("poupee", "victorienne", "barbie")

  "Est le #{a} avoir un seance en #{b} victorienne? #{c} #{d} #{e}"
end

def est_nom_fausse(a, b, c, d)
  nom_de_plumes = [
    [[a, a, a], [a, a, b], [a, a, c]],
    [[b, b, s], [b, b, b], [b, b, c]],
    [[c, c, a], [c, c, b], [c, c, c]],
  ]
  
  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  new_name = nom_de_plumes[cur_row][cur_col][cur_arr]

  if new_name == d
    "Checking if that Dolly's name might be fake: #{ner_name}. All thing accorded..."   
  else
    "Checking if that Dolly's name might be fake: #{ner_name}. This name seems to be not legitimate."
  end
end
