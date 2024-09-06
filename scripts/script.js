const difficulty = ["⚬⚬⚬","●⚬⚬","●●⚬","●●●"];


function flipCard() {
    document.getElementById('cardFlip').classList.toggle('flipped');
    contents = document.getElementsByClassName('cardContent')
    //Foreach content set scrollTop to 0
    Array.from(contents).forEach(content => {
        content.scrollTop = 0;
    });
}

function nextQuestion() {
    const cardFlip = document.getElementById('cardFlip');
    cardFlip.classList.add('card-exit-right');

    setTimeout(() => {
        cardFlip.classList.remove('card-exit-right');
        loadQuestion(1,(parseInt(document.getElementById('currentQuestion').textContent)+1),updateCardContent);
        cardFlip.classList.add('card-enter-left');
    }, 600);

    setTimeout(() => {
        cardFlip.classList.remove('card-enter-left');
    }, 1200);
}

function nextDirektQuestion() {
    const cardFlip = document.getElementById('cardFlip');
    cardFlip.classList.add('card-exit-right');

    setTimeout(() => {
        cardFlip.classList.remove('card-exit-right');
        loadQuestion(1,document.getElementById("skip_val").value,updateCardContent);
        cardFlip.classList.add('card-enter-left');
    }, 600);

    setTimeout(() => {
        cardFlip.classList.remove('card-enter-left');
    }, 1200);
}

function extractAllBold(str){
    const re = /#(.*?)#/g;
    const result = [];
    let current;
    while (current = re.exec(str)) {
      result.push(current.pop());
    }
    return result;
}

function updateCardContent(content) {
    if(content == null)
    {
        return;
    }
    counter = content.question_id;
    document.getElementById('currentQuestion').textContent = counter.toString();
    document.getElementById('cardTitle').textContent = content.title;
    document.getElementById('diffcu').textContent = difficulty[parseInt(content.difficulty)];

    //Handle FAT Question
    var question = content.question;
    question = question.replaceAll("\r","");
    question = question.replaceAll("\n","<br><br>");
    question = question.replaceAll("-*","   ->")
    var bolds = extractAllBold(question.toString());
    if(Array.isArray(bolds))
    {
        bolds.forEach(fat_str => {
            question = question.replace('#'+fat_str+'#', "<b>" + fat_str + "</b>");
        });
    }
    else {
        question = question.replace('#'+bolds+'#', "<b>" + bolds + "</b>");
    }
    document.getElementById('cardQuestion').innerHTML = question;


    // Handle FAT answers
    var answer = content.answer;
    answer = answer.replaceAll("\r","");
    answer = answer.replaceAll("\n","<br><br>");
    answer = answer.replaceAll("-*","   ->")
    var bolds = extractAllBold(answer.toString());
    if(Array.isArray(bolds))
    {
        bolds.forEach(fat_str => {
            answer = answer.replace('#'+fat_str+'#', "<b>" + fat_str + "</b>");
        });
    }
    else {
        answer = answer.replace('#'+bolds+'#', "<b>" + bolds + "</b>");
    }
    document.getElementById('cardAnswer').innerHTML = answer;


    // Handle Images
    if(content.aimage != "none")
        {
            document.getElementById('cardAImg').src = "./img/"+content.aimage;
            toggleAnswerCardImg(true)
        }
        else
        {
            toggleAnswerCardImg(false)
        }
    if(content.qimage != "none")
        {
            document.getElementById('cardImg').src = "./img/"+content.qimage;
            toggleQuestionCardImg(true)
        }
        else
        {
            toggleQuestionCardImg(false)
        }

    let fullPage = document.querySelector('#fullpage')
    //Img Enlargement
    let imgs = document.querySelectorAll('.img');
    imgs.forEach(img => {
        img.addEventListener('click', function() {
          fullPage.style.backgroundImage = 'url(' + img.src + ')';
          fullPage.style.display = 'block';
        });
      });

    
    const cardFlip = document.getElementById('cardFlip');
    cardFlip.classList.remove('flipped');
}

function toggleQuestionCardImg(toggle) {
    const cardImg = document.getElementsByClassName("qImg")[0];
    let fullPage = document.querySelector('#fullpage')
    let imgs = document.querySelectorAll('.img');
    imgs.forEach(img => {
        img.addEventListener('click', function() {
          fullPage.style.backgroundImage = 'url(' + img.src + ')';
          fullPage.style.display = 'block';
        });
      });
    if(toggle == false)
    {
        cardImg.style.display = "none";
    }
    else
    {
        cardImg.style.display = "block";
    }
}

function toggleAnswerCardImg(toggle) {
    const cardImg = document.getElementsByClassName('aImg')[0];
    let fullPage = document.querySelector('#fullpage')
    let imgs = document.querySelectorAll('.img');
    imgs.forEach(img => {
        img.addEventListener('click', function() {
          fullPage.style.backgroundImage = 'url(' + img.src + ')';
          fullPage.style.display = 'block';
        });
      });
    if(toggle == false)
    {
        cardImg.style.display = "none";
    }
    else
    {
        cardImg.style.display = "block";
    }
}

function loadQuestion(card_set, questID, callback) {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', './scripts/query_card.php', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onload = function() {
        if (xhr.status >= 200 && xhr.status < 400) {
            // Verarbeite die JSON-Antwort
            var response = JSON.parse(xhr.responseText);
            if (response.length > 0) {
                callback(response[0]);
            } else {
                console.error('Keine Daten gefunden.');
                callback(null);
            }
        } else {
            console.error('Fehler bei der Anfrage.');
            callback(null);
        }
    };
    xhr.send('card_set=' + encodeURIComponent(card_set) + '&question_id=' + encodeURIComponent(questID));
}