areaStructure = "<h3>Numer strefy</h3>
<input type='text'>
<h3>Kody pocztowe(odzielone średnikiem)</h3> 
<input type='text'>
<table id='area' class='area_number'>
<tr><th>Ilość palet</th><th>Rabat netto</th><th>Logistyka netto</th><th>Cena brutto</th><th>Cena brutto 1 tona</th><th>Transport dla klienta</th></tr>
<tr>
<td>1</td>
<td><input type='text'></td>
<td><input type='text'></td>
<td>200.34</td>
<td>2003.40</td>
<td>53.43</td>
</tr>
<tr>
<td>2</td>
<td><input type='text'></td>
<td><input type='text'></td>
<td>200.34</td>
<td>2003.40</td>
<td>53.43</td>
</tr>
<tr>
<td>3</td>
<td><input type='text'></td>
<td><input type='text'></td>
<td>200.34</td>
<td>2003.40</td>
<td>53.43</td>
</tr>
<tr>
<td>4</td>
<td><input type='text'></td>
<td><input type='text'></td>
<td>200.34</td>
<td>2003.40</td>
<td>53.43</td>
</tr>
<tr>
<td>5</td>
<td><input type='text'></td>
<td><input type='text'></td>
<td>200.34</td>
<td>2003.40</td>
<td>53.43</td>
</tr>
<tr>
<td>6</td>
<td><input type='text'></td>
<td><input type='text'></td>
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
  areas.insertAdjacentHTML("afterBegin", areaStructure.replace("area_number", "area_" + area_id))
)

