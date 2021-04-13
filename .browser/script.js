const quote = quotes[Math.floor(Math.random()*quotes.length)]
const quoteElement = document.querySelector('.quote__text')
const authorElement = document.querySelector('.quote__author')

quoteElement.innerText = quote.quoteText
authorElement.innerText = quote.quoteAuthor
