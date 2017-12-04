## Interface as design tool

In Jolie the concept of interface is strongly coupled to the use of communication port as explained in the [Comunicatiion Ports](/documentation/getting_started/comunication_ports.html). Yet it can be used as a designing tool in order to define microservices application domain.
For example let's think to start modeling a mathematical service containing

<pre><code class="language-jolie code">
interface MathInterface {
	RequestResponse:
   sum(SumRequest)(SumResponse),
	 cosine(cosineRequest)(cosineResponse)
}
</code></pre>

After some discussion the design team arrives to the conclusion that is better to separate the arithmetic operations from the trigonometric one with the resultic code  


<pre><code class="language-jolie code">
interface ArithmeticInterface {
	RequestResponse:
   sum(SumRequest)(SumResponse),
	 cosine(cosineRequest)(cosineResponse)
}

interface TrigonometricInterface {
	RequestResponse:
	 cosine(cosineRequest)(cosineResponse)
}
</code></pre>

From a pratical point of view an microservice can implement both interfaces and expose them on the identical port yet it may come usefull to think to the interfaces as domoin delimiters.
