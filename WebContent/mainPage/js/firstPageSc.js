$(document).ready(function() {
  const selectSVG = id => {
    const el = $(`#${id}`);
    return new SVGElement(el);
  };

  const createSVG = type => {
    const el = $(document.createElementNS('http://www.w3.org/2000/svg', type));
    return new SVGElement(el);
  };

  class SVGElement {
    constructor(element) {
      this.element = element;
    }

    set(attributeName, value) {
      this.element.attr(attributeName, value);
    }

    style(property, value) {
      this.element.css(property, value);
    }
  }

  const colors = [
	  { main: '#FBDB4A', shades: ['#FAE073', '#FCE790', '#FADD65', '#E4C650'] },
	  { main: '#F3934A', shades: ['#F7B989', '#F9CDAA', '#DD8644', '#F39C59'] },
	  { main: '#EB547D', shades: ['#EE7293', '#F191AB', '#D64D72', '#C04567'] },
	  { main: '#9F6AA7', shades: ['#B084B6', '#C19FC7', '#916198', '#82588A'] },
	  { main: '#5476B3', shades: ['#6382B9', '#829BC7', '#4D6CA3', '#3E5782'] },
	  { main: '#2BB19B', shades: ['#4DBFAD', '#73CDBF', '#27A18D', '#1F8171'] },
	  { main: '#70B984', shades: ['#7FBE90', '#98CBA6', '#68A87A', '#5E976E'] }
	];


  const svg = selectSVG('svg');
  const text = $('#text');
  const offscreenText = $('#offscreen-text');
  const input = $('#input');
  let width = window.innerWidth;
  let height = window.innerHeight;
  let textSize = 0;
  let textCenter = 0;
  const letters = [];
  const prompt = ['안', '녕', '하', '세', '요', ' ', '반', '갑', '읍', '니', '다', '.'];
  let runPrompt = true;

  const resizePage = () => {
    width = window.innerWidth;
    height = window.innerHeight;
    svg.set('height', height);
    svg.set('width', width);
    svg.set('viewBox', `0 0 ${width} ${height}`);
    resizeLetters();
  }

  const resizeLetters = () => {
    textSize = width / (letters.length + 2);
    if (textSize > 100) textSize = 100;
    text.css('fontSize', `${textSize}px`);
    text.css('height', `${textSize}px`);
    text.css('lineHeight', `${textSize}px`);
    offscreenText.css('fontSize', `${textSize}px`);
    const textRect = text[0].getBoundingClientRect();
    textCenter = textRect.top + textRect.height / 2;
    positionLetters();
  }

  const positionLetters = () => {
    letters.forEach(letter => {
      const timing = letter.shift ? 0.1 : 0;
      letter.onScreen.css({
        left: `${letter.offScreen[0].offsetLeft}px`,
        transitionDelay: `${timing}s`
      });
      letter.shift = true;
    });
  };

const animateLetterIn = letter => {
  if (!letter || !letter.onScreen || !letter.offScreen) {
    console.error('Invalid letter object:', letter);
    return;
  }

  const onScreenElement = letter.onScreen[0]; // jQuery 객체에서 DOM 요소로 변환

  // 초기 애니메이션 설정
  onScreenElement.style.transform = 'scale(1)';
  onScreenElement.style.opacity = '1';
  onScreenElement.style.transformOrigin = 'center bottom';
  onScreenElement.style.transition = 'transform 0.4s cubic-bezier(0.68,-0.55,0.27,1.55), opacity 0.4s cubic-bezier(0.68,-0.55,0.27,1.55)';
  onScreenElement.style.transitionDelay = '0.15s';
  onScreenElement.style.transitionTimingFunction = 'cubic-bezier(0.47,2.02,0.31,-0.36)';

  // 200 밀리초 후에 나머지 애니메이션 적용
  setTimeout(() => {
    onScreenElement.style.transition = 'transform 0.2s cubic-bezier(0.47,2.02,0.31,-0.36) 0.2s';
    onScreenElement.style.transform = 'translateY(0)';
    onScreenElement.style.transition = 'transform 0.2s cubic-bezier(0.47,2.02,0.31,-0.36) 0.2s';
    onScreenElement.style.transform = 'rotate(0deg)';
  }, 200);

};





  const addDecor = (letter, color) => {
    setTimeout(() => {
      var rect = letter[0].getBoundingClientRect();
      const x0 = letter[0].offsetLeft + letter[0].offsetWidth / 2;
      const y0 = textCenter - textSize * 0.5;
      const shade = color.shades[Math.floor(Math.random() * 4)];
      for (var i = 0; i < 8; i++) addTri(x0, y0, shade);
      for (var i = 0; i < 8; i++) addCirc(x0, y0);
    }, 150);
  };

  const addTri = (x0, y0, shade) => {
    const tri = createSVG('polygon');
    const a = Math.random();
    const a2 = a + (-0.2 + Math.random() * 0.4);
    const r = textSize * 0.52;
    const r2 = r + textSize * Math.random() * 0.2;
    const x = x0 + r * Math.cos(2 * Math.PI * a);
    const y = y0 + r * Math.sin(2 * Math.PI * a);
    const x2 = x0 + r2 * Math.cos(2 * Math.PI * a2);
    const y2 = y0 + r2 * Math.sin(2 * Math.PI * a2);
    const triSize = textSize * 0.1;
    const scale = 0.3 + Math.random() * 0.7;
    const offset = triSize * scale;
    tri.set('points', `0,0 ${triSize * 2},0 ${triSize},${triSize * 2}`);
    tri.style('fill', shade);
    svg.element.append(tri.element);
    TweenLite.fromTo(tri.element, 0.6, { rotation: Math.random() * 360, scale: scale, x: x - offset, y: y - offset, opacity: 1 }, {
      x: x2 - offset,
      y: y2 - offset,
      opacity: 0,
      ease: Power2.easeInOut,
      onComplete: () => {
        svg.element.remove(tri.element);
      }
    });
  };

  const addCirc = (x0, y0) => {
    const circ = createSVG('circle');
    const a = Math.random();
    const r = textSize * 0.52;
    const r2 = r + textSize;
    const x = x0 + r * Math.cos(2 * Math.PI * a);
    const y = y0 + r * Math.sin(2 * Math.PI * a);
    const x2 = x0 + r2 * Math.cos(2 * Math.PI * a);
    const y2 = y0 + r2 * Math.sin(2 * Math.PI * a);
    const circSize = textSize * 0.05 * Math.random();
    circ.set('r', circSize);
    circ.style('fill', '#eee');
    svg.element.append(circ.element);
    TweenLite.fromTo(circ.element, 0.6, { x: x - circSize, y: y - circSize, opacity: 1 }, {
      x: x2 - circSize,
      y: y2 - circSize,
      opacity: 0,
      ease: Power1.easeInOut,
      onComplete: () => {
        svg.element.remove(circ.element);
      }
    });
  };

  const addLetter = (char, i) => {
    const letter = $('<span></span>');
    const oLetter = $('<span></span>');
    letter.html(char);
    oLetter.html(char);
    text.append(letter);
    const color = colors[i % colors.length];
    letter.css('color', color.main);
    offscreenText.append(oLetter);
    letters[i] = { offScreen: oLetter, onScreen: letter, char: char };
    animateLetterIn(letter);
    addDecor(oLetter, color);
  };

  const addLetters = value => {
    value.forEach((char, i) => {
      if (letters[i] && letters[i].char !== char) {
        letters[i].onScreen.html(char);
        letters[i].offScreen.html(char);
        letters[i].char = char;
      }
      if (letters[i] === undefined) {
        addLetter(char, i);
      }
    });
  };

  const animateLetterOut = (letter, i) => {
    TweenLite.to(letter.onScreen, 0.1, { scale: 0, opacity: 0, ease: Power2.easeIn, onComplete: () => {
      console.log('removing');
      console.log(letter);
      letter.offScreen.remove();
      letter.onScreen.remove();
      positionLetters();
    } });
    letters.splice(i, 1);
  };

  const removeLetters = value => {
    for (let i = letters.length - 1; i >= 0; i--) {
      const letter = letters[i];
      if (value[i] === undefined) {
        animateLetterOut(letter, i);
      }
    }
  };

  const onInputChange = () => {
    const inputValue = input.val();
    const value = inputValue === '' ? [] : inputValue.toLowerCase().split('');
    addLetters(value);
    removeLetters(value);
    resizeLetters();
  };

  const keyup = (e) => {
    if (runPrompt) {
      input.val('');
      runPrompt = false;
    }
    onInputChange();
  };

  const addPrompt = (i) => {
    setTimeout(() => {
      if (runPrompt && prompt[i]) {
        input.val(input.val() + prompt[i]);
        onInputChange();
        addPrompt(i + 1);
      }
    }, 300);
  };

  resizePage();
  $(window).resize(resizePage);
  input.on('keyup', keyup);
  input.focus();
  addPrompt(0);
});
