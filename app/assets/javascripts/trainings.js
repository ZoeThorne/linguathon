function getWordsFromAjax(){
	console.log("JS linked OK")
	// var id = "#{@training.id}";
	console.log(id)
	$.ajax({
		type: "GET", 
		url: "/api/trainings/"+id+"/words",
		success: showFirstQuestion, 
		error: handleError
	});
};

// function showFirstQuestion(response){
// 	console.log("It worked");
// 	console.log(response[0]);
// 	$('.training-question-1').empty();
// 	var q = `<h1>${response[0].english}</h1>
// 				<br><h3>What is the German?</h3>`;
// 	$('.training-question-1').append(q)

// };

function getFirstAnswer(){
	$('.answer-question-1').submit(function(event){
		event.preventDefault();
		var guess1 = $('#q1-answer').val();
		console.log(guess1)
		$('.training-1').hide();
		$('.training-2').show();
	});
};


function handleError(error){
	console.log("Error");
	console.log(error.responseText); 
}

$(document).on('ready', function () {
	getWordsFromAjax();
	getFirstAnswer();
});