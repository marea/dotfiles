const quote = quotes[Math.floor(Math.random()*quotes.length)]
const quoteElement = document.querySelector('#quote')
const authorElement = document.querySelector('#author')

quoteElement.innerText = quote.quoteText
authorElement.innerText = quote.quoteAuthor
