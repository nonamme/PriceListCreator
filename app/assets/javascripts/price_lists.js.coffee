areaStructure = "<h3>Numer strefy</h3>
<input type='text' value='number_area'>
<h3>Kody pocztowe(odzielone średnikiem)</h3> 
<textarea name='areas[area_number][postcode]' id='areas[area_number][postcode]'></textarea>
<table id='area' class='area_number' >
<tr><th>Ilość palet</th><th>Rabat netto</th><th>Logistyka netto</th></tr>
<tr>
<td>1</td>
<td><input type='text' name='areas[area_number][1][net_rabate]' id='areas[area_number][1][net_rabate]'></td>
<td><input type='text' name='areas[area_number][1][net_logistic]' id='areas[area_number][1][net_logistic]'></td>
</tr>
<tr>
<td>2</td>
<td><input type='text' name='areas[area_number][2][net_rabate]' id='areas[area_number][2][net_rabate]'></td>
<td><input type='text' name='areas[area_number][2][net_logistic]' id='areas[area_number][2][net_logistic]'></td>
</tr>
<tr>
<td>3</td>
<td><input type='text' name='areas[area_number][3][net_rabate]' id='areas[area_number][3][net_rabate]'></td>
<td><input type='text' name='areas[area_number][3][net_logistic]' id='areas[area_number][3][net_logistic]'></td>
</tr>
<tr>
<td>4</td>
<td><input type='text' name='areas[area_number][4][net_rabate]' id='areas[area_number][4][net_rabate]'></td>
<td><input type='text' name='areas[area_number][4][net_logistic]' id='areas[area_number][4][net_logistic]'></td>
</tr>
<tr>
<td>5</td>
<td><input type='text' name='areas[area_number][5][net_rabate]' id='areas[area_number][5][net_rabate]'></td>
<td><input type='text' name='areas[area_number][5][net_logistic]' id='areas[area_number][5][net_logistic]'></td>
</tr>
<tr>
<td>6</td>
<td><input type='text' name='areas[area_number][6][net_rabate]' id='areas[area_number][6][net_rabate]'></td>
<td><input type='text' name='areas[area_number][6][net_logistic]' id='areas[area_number][6][net_logistic]'></td>
</tr>
</table>
"
areas = document.querySelector("#areas")
add_area_button = document.querySelector("#add_area")
add_extra_area_button = document.querySelector("#add_extra_area")

if(add_area_button != null)
	add_area_button.addEventListener('click', (event) ->
	  area_id = document.querySelectorAll('#area').length
	  area_id++
	  areas.insertAdjacentHTML("afterBegin",
	      areaStructure.replace(/area_number/gi, "area_" + area_id)
	                  .replace(/number_area/gi, area_id))
	)

if (add_extra_area_button != null)
	add_extra_area_button.addEventListener('click', (event) ->
	  area_id = document.querySelectorAll('#area').length
	  area_id++
	  areas.insertAdjacentHTML("afterBegin",
	      areaStructure.replace(/area_number/gi, "area_" + area_id)
	                  .replace(/number_area/gi, area_id))
	)
