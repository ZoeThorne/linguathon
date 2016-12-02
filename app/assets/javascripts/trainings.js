function getWordsFromAjax(){
	// var id = "#{@training.id}";
	console.log(id)
	$.ajax({
		type: "GET", 
		url: "/api/trainings/"+id+"/words",
		success: generateQuestions, 
		error: handleError
	});
};

function generateQuestions(response){
	$( "[class*=training-question]" ).each(function( index ) {
	  $( this ).empty();
	  var questionNumber = index + 1;
	  var q = `
			<h1>${questionNumber}. &nbsp; <strong>${response[index].english}</strong></h1>
			<br><h3>What is the German?</h3>
	  		`;
	  $( this ).append(q);
	});

	$('.js-answer').each(function(index) {
		$(this).attr("id",response[index].id);
	});

};

var counter = 1
function getAnswer(){
	$(document).on('click', '[class=answer-question-' + counter +'] button', function (event){
	// $("[class*=answer-question]" ).submit(function(event){
		event.preventDefault();
		console.log("Form submitted")
		var guess = $(this).parent().find('input:text').val();
		var answer = $(this).parent().find('input:hidden').attr('id');
		console.log($('[class=answer-question-' + counter +']'))
		console.log(guess);
		console.log(answer);
		counter++
		ajaxCheck(guess, answer);
	});
};

// function getFirstAnswer(){
// 	$('.answer-question-1').submit(function(event){
// 		event.preventDefault();
// 		var guess1 = $('#q1-answer').val();
// 		var answer1 = $('input:hidden').attr('id');
// 		console.log(guess1)
// 		console.log(answer1)
// 		ajaxCheck(guess1, answer1);
// 	});
// };

function ajaxCheck(guess, answer){;
	$.ajax({
		type: "POST",
		data: {guess: guess},
		dataType: 'json',
		url: "/api/trainings/"+id+"/words/"+answer+"/check",
		success: function(response){
			result = response.status
			console.log(result)
			$('.response').empty();
			if (result == "correct") {
				$('.response').append("Correct!")
			} else {
				$('.response').append("The answer was actually " +response.tl)
			}
			var next = `
				<br>
				<button id="next" class="next" name="next">Next</button>
			`

			var finish = `
				<br>
				<button id="finish" class="finish" name="finish">Finished Training</button>
			`
			// $('.response').append(next)
			// 	getAnswer();

			if (counter <= 10) {
				$('.response').append(next)
					getAnswer();
					
			} else {
				$('.response').append(finish)
			};

		}, 
		error: handleError
	});
};

function nextQuestion(){
	$(document).on('click', '.next', function (event){
  		event.preventDefault();
  		var q = (counter - 1);
  		$('[class=training-'+ q +']').hide();
		$('[class=training-'+ counter +']').show();
		$('.response').empty();
		// console.log(q);
		// console.log($('[class=training-'+ q +']'));
	});
};

// function checkAnswer(response){
// 	console.log(response);
// 	// console.log(guess1);
// };


function handleError(error){
	console.log("Error");
	console.log(error.responseText); 
}

$(document).on('ready', function () {
	getWordsFromAjax();
	getAnswer();
	// getFirstAnswer();
	nextQuestion();
});