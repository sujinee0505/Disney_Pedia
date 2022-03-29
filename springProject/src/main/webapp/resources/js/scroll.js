	$(function() {
		var width = $('.scroll').width();
		$(document).on('click', '.right', function() {
			var scrollX = $(this).siblings('.scroll').scrollLeft();
			$(this).siblings('.scroll').scrollLeft(scrollX + width);
		});
		$(document).on('click', '.left', function() {
			var scrollX = $(this).siblings('.scroll').scrollLeft();
			$(this).siblings('.scroll').scrollLeft(scrollX - width);
		});
		$('.scroll').scroll(
				function() {
					if ($(this).scrollLeft() + $(this).innerWidth() >= $(this)
							.prop('scrollWidth')) {
						$(this).parent().find('.right').hide();
					} else {
						$(this).parent().find('.right').show();
					}
				});
		$('.scroll').scroll(function() {
			if ($(this).scrollLeft() == 0) {
				$(this).parent().find('.left').hide();
			} else if ($(this).scrollLeft() != 0) {
				$(this).parent().find('.left').show();
			}
		});

		more = function() {
			var status = $('#status').text();
			if (status == '더보기') {
				$('#overview').css('display', 'block');
				$('#status').text('접기');
			} else if (status == '접기') {
				$('#overview').css('display', '-webkit-box');
				$('#status').text('더보기');
			}
		}
		$(document).ready(
				function() {
					var height = $('#overview').height();
					if (height > 96) {
						$('#overview').removeClass('css-kywn6v-StyledText')
								.addClass('css-kywn7v-StyledText');
						$('#status').show();
					}
				});
				
	let dateCheck = document.getElementById("dateCheck").value;
	let yearCheck = dateCheck.substr(0, 4);
	let monthCheck = dateCheck.substr(4, 2);
	let dayCheck = dateCheck.substr(6, 2); 

		const init = {
  /*monList: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']*/
  monList: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
  dayList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
  today: new Date(),
  monForChange: new Date().getMonth(),
  activeDate: new Date(),
  getFirstDay: (yy, mm) => new Date(yy, mm, 1),
  getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
  nextMonth: function () {
    let d = new Date();
    d.setDate(1);
    d.setMonth(++this.monForChange);
    this.activeDate = d;
    return d;
  },
  prevMonth: function () {
    let d = new Date();
    d.setDate(1);
    d.setMonth(--this.monForChange);
    this.activeDate = d;
    return d;
  },
  addZero: (num) => (num < 10) ? '0' + num : num,
  activeDTag: null,
  getIndex: function (node) {
    let index = 0;
    while (node = node.previousElementSibling) {
      index++;
    }
    return index;
  }
};

const $calBody = document.querySelector('.cal-body');
const $btnNext = document.querySelector('.btn-cal.next');
const $btnPrev = document.querySelector('.btn-cal.prev');

/**
 * @param {number} date
 * @param {number} dayIn
*/
function loadDate (date, dayIn) {
  document.querySelector('.cal-date').textContent = date;
  document.querySelector('.cal-day').textContent = init.dayList[dayIn];
}

/**
 * @param {date} fullDate
 */
function loadYYMM (fullDate) {
  let yy = fullDate.getFullYear();
  let mm = fullDate.getMonth();
  let firstDay = init.getFirstDay(yy, mm);
  let lastDay = init.getLastDay(yy, mm);
  let markToday;  // for marking today date
  
  if (init.addZero(mm + 1) === monthCheck && yy == yearCheck) {
    markToday = dayCheck;
  }
  document.querySelector('.cal-month').textContent = init.monList[mm];
  document.querySelector('.cal-year').textContent = yy;

  let trtd = '';
  let startCount;
  let countDay = 0;
  for (let i = 0; i < 6; i++) {
    trtd += '<tr>';
    for (let j = 0; j < 7; j++) {
      if (i === 0 && !startCount && j === firstDay.getDay()) {
        startCount = 1;
      }
      if (!startCount) {
        trtd += '<td>'
      } else {
        let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
        trtd += '<td id="day" class="day2';
        trtd += (markToday && markToday == countDay + 1) ? ' today" ' : '"';
        trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
      }
      trtd += (startCount) ? ++countDay : '';
      if (countDay === lastDay.getDate()) { 
        startCount = 0; 
      }
      trtd += '</td>';
    }
    trtd += '</tr>';
  }
  $calBody.innerHTML = trtd;
}

/**
 * @param {string} val
 */
function createNewList (val) {
  let id = new Date().getTime() + '';
  let yy = init.activeDate.getFullYear();
  let mm = init.activeDate.getMonth() + 1;
  let dd = init.activeDate.getDate();
  const $target = $calBody.querySelector(`.day2[data-date="${dd}"]`);

  let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);

  let eventData = {};
  eventData['date'] = date;
  eventData['memo'] = val;
  eventData['complete'] = false;
  eventData['id'] = id;
  init.event.push(eventData);
  $todoList.appendChild(createLi(id, val, date));
}

loadYYMM(init.today);
loadDate(init.today.getDate(), init.today.getDay());

$btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
$btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));

const todayEl = document.querySelector('td');
const classes = todayEl.classList;

$calBody.addEventListener('click', (e) => {
  if (e.target.classList.contains('day2')) {
    if (init.activeDTag) {
      init.activeDTag.classList.remove('day-active');
    }
    let day = Number(e.target.textContent);
    loadDate(day, e.target.cellIndex);
    if (!classes.contains('today')) {
    e.target.classList.add('day-active');
    }
    init.activeDTag = e.target;
    init.activeDate.setDate(day);
    /*reloadTodo();
    alert(document.querySelector('.cal-year').textContent+ document.querySelector('.cal-month').textContent + day);*/
  }
});
	});