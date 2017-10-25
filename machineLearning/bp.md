[toc]
##backword propagation
important defination
1. $$a^l = \sigma(z^l)$$
2. $$\delta^l = \frac{\partial C}{\partial z^l}$$
###four important equations
####first layer
$$\delta^L_j = \frac{\partial C}{\partial a^L_j}\sigma'(z^L_j)$$ or
$$\delta^L=\nabla_aC\odot\delta'(z^L)$$
pay attension to captital L which means the total number of layers
####$\delta$ and next layer
$$\delta^l = ((w^{l+1})^T\delta^{l+1}) \odot \sigma'(z^l)$$
####about bias
$$\frac{\partial C}{\partial b^l_j} = \delta^l_j$$
you can understand it as
$$a_0^{l-1} = 1$$
as an additional "bias node"
so that it is consistent with the equation below
####about weight
$$\frac{\partial C}{w^l_{jk}} = a^{l-1}_k\delta^l_j$$
or
$$\frac{\partial C}{\partial w} = a_{in}\delta{out}$$
###spiring codes