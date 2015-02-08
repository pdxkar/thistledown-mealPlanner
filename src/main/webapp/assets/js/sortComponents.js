/**
 * Alphabetizes components
 */

function sortByItemName(array, itemName) {
    return array.sort(function(a, b) {
        var x = a[itemName]; var y = b[itemName];
        return ((x < y) ? -1 : ((x > y) ? 1 : 0));
    });
}

function quickSort(array){

	var lessThan = new Array();
	var greaterThan = new Array();

	var item = array.pop();
	

	for (var j = 0; j < array.length; j++) { 
		if (array[j].itemname < item.itemname){
			lessThan.push(array[j]);
		} else if (array[j].itemname > item.itemname){
			greaterThan.push(array[j]);
		} else if (array[j].itemname = item.itemname){
			lessThan.push(array[j]);
		}
	}
	if (lessThan.length > 1){
		lessThan = quickSort(lessThan);
	}
	if (greaterThan.length > 1){
		greaterThan = quickSort(greaterThan);
	}
	lessThan.push(item);
	var sortedDet = lessThan.concat(greaterThan);
	return sortedDet;
}