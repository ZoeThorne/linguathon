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
	// var totalQuestions = 10;
	// var currentQuestion = 0;
	// var $questions = $(".training-question");
	// console.log($questions);
	// // $($questions.eq(currentQuestion)).show();
	// $(".training-question").eq(currentQuestion).show();
	// console.log(currentQuestion);
	// console.log($(".training-question").eq(currentQuestion))
};


// function getAnswer(){
// 	$("[class*=answer-question]" ).submit(function(event){
// 		event.preventDefault();
// 		var guess = $( event.currentTarget ).val();
// 		console.log(guess)
// 		// $('.training-1').hide();
// 		// $('.training-2').show();
// 	});
// };

function getFirstAnswer(){
	$('.answer-question-1').submit(function(event){
		event.preventDefault();
		var guess1 = $('#q1-answer').val();
		var answer1 = $('input:hidden').attr('id');
		console.log(guess1)
		console.log(answer1)
		ajaxCheck(guess1, answer1);
	});
};

function ajaxCheck(guess1, answer1){;
	$.ajax({
		type: "POST",
		data: {guess: guess1},
		dataType: 'json',
		url: "/api/trainings/"+id+"/words/"+answer1+"/check",
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
			$('.response').append(next)
		}, 
		error: handleError
	});
};

function nextQuestion(){
	$(document).on('click', '.next', function (event){
  		event.preventDefault();
  		$('.training-1').hide();
		$('.training-2').show();
		$('.response').empty();
		console.log("Button clicked");
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
	// getAnswer();
	getFirstAnswer();
	nextQuestion();
});