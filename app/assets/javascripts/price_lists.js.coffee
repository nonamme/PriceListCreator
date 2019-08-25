areaStructure = "<h3>Numer strefy</h3>
<input type='text' value='number_area'>
<h3>Kody pocztowe(odzielone średnikiem)</h3> 
<input type='text' name='areas[area_number][postcode]' id='areas[area_number][postcode]'>
<table id='area' class='area_number' >
<tr><th>Ilość palet</th><th>Rabat netto</th><th>Logistyka netto</th><th>Cena brutto</th><th>Cena brutto 1 tona</th><th>Transport dla klienta</th></tr>
<tr>
<td>1</td>
<td><input type='text' name='areas[area_number][1][rabate]' id='areas[area_number][1][rabate]'></td>
<td><input type='text' name='areas[area_number][1][logistic]' id='areas[area_number][1][logistic]'></td>
<td>200.34</td>
<td>2003.40</td>
<td>53.43</td>
</tr>
<tr>
<td>2</td>
<td><input type='text' name='areas[area_number][2][rabate]' id='areas[area_number][2][rabate]'></td>
<td><input type='text' name='areas[area_number][2][logistic]' id='areas[area_number][2][logistic]'></td>
<td>200.34</td>
<td>2003.40</td>
<td>53.43</td>
</tr>
<tr>
<td>3</td>
<td><input type='text' name='areas[area_number][3][rabate]' id='areas[area_number][3][rabate]'></td>
<td><input type='text' name='areas[area_number][3][logistic]' id='areas[area_number][3][logistic]'></td>
<td>200.34</td>
<td>2003.40</td>
<td>53.43</td>
</tr>
<tr>
<td>4</td>
<td><input type='text' name='areas[area_number][4][rabate]' id='areas[area_number][4][rabate]'></td>
<td><input type='text' name='areas[area_number][4][logistic]' id='areas[area_number][4][logistic]'></td>
<td>200.34</td>
<td>2003.40</td>
<td>53.43</td>
</tr>
<tr>
<td>5</td>
<td><input type='text' name='areas[area_number][5][rabate]' id='areas[area_number][5][rabate]'></td>
<td><input type='text' name='areas[area_number][5][logistic]' id='areas[area_number][5][logistic]'></td>
<td>200.34</td>
<td>2003.40</td>
<td>53.43</td>
</tr>
<tr>
<td>6</td>
<td><input type='text' name='areas[area_number][6][rabate]' id='areas[area_number][6][rabate]'></td>
<td><input type='text' name='areas[area_number][6][logistic]' id='areas[area_number][6][logistic]'></td>
<td>200.34</td>
<td>2003.40</td>
<td>53.43</td>
</tr>
</table>
"
areas = document.querySelector("#areas")
add_area_button = document.querySelector("#add_area")
area_id = 0

add_area_button.addEventListener('click', (event) ->
  area_id++
  areas.insertAdjacentHTML("afterBegin",
      areaStructure.replace(/area_number/gi, "area_" + area_id)
                  .replace(/number_area/gi, area_id))
)

