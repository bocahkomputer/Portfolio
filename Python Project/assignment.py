"""
Author: Darren Luwi (29051754)
"""
# Part 1 (due Week 6)
def linear(x, w, b): # 1 Mark
    """
    Input: A list of inputs (x), a list of weights (w) and a bias (b).
    Output: A single number corresponding to the value of f(x) in Equation 1.

    >>> x = [1.0, 3.5]
    >>> w = [3.8, 1.5]
    >>> b = -1.7
    >>> round(linear(x, w, b),6) #linear(x, w, b)
    7.35
    """

    return sum(w[j]*x[j] for j in range(len(w))) + b


def linear_layer(x, w, b): # 1 Mark
    """
    Input: A list of inputs (x), a table of weights (w) and a list of 
           biases (b).
    Output: A list of numbers corresponding to the values of f(x) in
            Equation 2.
    
    >>> x = [1.0, 3.5]
    >>> w = [[3.8, 1.5], [-1.2, 1.1]]
    >>> b = [-1.7, 2.5]
    >>> y = linear_layer(x, w, b)
    >>> [round(y_i,6) for y_i in y] #linear_layer(x, w, b)
    [7.35, 5.15]
    """

    return [linear(x, w[i], b[i]) for i in range(len(w))]


def inner_layer(x, w, b): # 1 Mark
    """
    Input: A list of inputs (x), a table of weights (w) and a 
           list of biases (b).
    Output: A list of numbers corresponding to the values of f(x) in 
            Equation 4.

    >>> x = [1, 0]
    >>> w = [[2.1, -3.1], [-0.7, 4.1]]
    >>> b = [-1.1, 4.2]
    >>> y = inner_layer(x, w, b)
    >>> [round(y_i,6) for y_i in y] #inner_layer(x, w, b)
    [1.0, 3.5]
    >>> x = [0, 1]
    >>> y = inner_layer(x, w, b)
    >>> [round(y_i,6) for y_i in y] #inner_layer(x, w, b)
    [0.0, 8.3]
    """

    return [max(linear(x, w[i], b[i]), 0.0) for i in range(len(w))]


def inference(x, w, b): # 2 Marks
    """
    Input: A list of inputs (x), a list of tables of weights (w) and a table
           of biases (b).
    Output: A list of numbers corresponding to output of the ANN.
    
    >>> x = [1, 0]
    >>> w = [[[2.1, -3.1], [-0.7, 4.1]], [[3.8, 1.5], [-1.2, 1.1]]]
    >>> b = [[-1.1, 4.2], [-1.7, 2.5]]
    >>> y = inference(x, w, b)
    >>> [round(y_i,6) for y_i in y] #inference(x, w, b)
    [7.35, 5.15]
    """

    num_layers = len(w)
    
    for l in range(num_layers-1):
        x = inner_layer(x, w[l], b[l])
        
    return linear_layer(x, w[num_layers-1], b[num_layers-1])


def read_weights(file_name): # 1 Mark
    """
    Input: A string (file_name) that corresponds to the name of the file
           that contains the weights of the ANN.
    Output: A list of tables of numbers corresponding to the weights of
            the ANN.
    
    >>> w_example = read_weights('example_weights.txt')
    >>> w_example
    [[[2.1, -3.1], [-0.7, 4.1]], [[3.8, 1.5], [-1.2, 1.1]]]
    >>> w = read_weights('weights.txt')
    >>> len(w)
    3
    >>> len(w[2])
    10
    >>> len(w[2][0])
    16
    """

    weights_file = open(file_name,"r")
    w = []
    for line in weights_file:
        if "#" == line[0]:
            w.append([])
        else:
            w[-1].append([float(w_ij) for w_ij in line.strip().split(",")])
    
    return w


def read_biases(file_name): # 1 Mark
    """
    Input: A string (file_name), that corresponds to the name of the file
           that contains the biases of the ANN.
    Output: A table of numbers corresponding to the biases of the ANN.
    
    >>> b_example = read_biases('example_biases.txt')
    >>> b_example
    [[-1.1, 4.2], [-1.7, 2.5]]
    >>> b = read_biases('biases.txt')
    >>> len(b)
    3
    >>> len(b[0])
    16
    """

    biases_file = open(file_name,"r")
    b = []
    for line in biases_file:
        if not "#" == line[0]:
            b.append([float(b_j) for b_j in line.strip().split(",")])
    
    return b


def read_image(file_name): # 1 Mark
    """
    Input: A string (file_name), that corresponds to the name of the file
           that contains the image.
    Output: A list of numbers corresponding to input of the ANN.
    
    """

    image_file = open(file_name,"r")
    x = []
    for line in image_file:
        for x_i in line.strip():
            x.append(int(x_i))
            
    return x


def argmax(x): # 1 Mark
    """
    Input: A list of numbers (i.e., x) that can represent the scores 
           computed by the ANN.
    Output: A number representing the index of an element with the maximum
            value, the function should return the minimum index.
    
    >>> x = [1.3, -1.52, 3.9, 0.1, 3.9]
    >>> argmax(x)
    2
    """

    num_inputs = len(x)
    max_index = 0
    
    for i in range(1,num_inputs):
        if x[max_index] < x[i]:
            max_index = i
            
    return  max_index


def predict_number(image_file_name, weights_file_name, biases_file_name): # 1 Mark
    """
    Input: A string (i.e., image_file_name) that corresponds to the image
           file name, a string (i.e., weights_file_name) that corresponds
           to the weights file name and a string (i.e., biases_file_name)
           that corresponds to the biases file name.
    Output: The number predicted in the image by the ANN.

    >>> i = predict_number('image.txt', 'weights.txt', 'biases.txt')
    >>> print('The image is number ' + str(i))
    The image is number 4
    """

    x = read_image(image_file_name)
    w = read_weights(weights_file_name)
    b = read_biases(biases_file_name)
    
    y = inference(x, w, b)
    return argmax(y)

#Part 2:Adversarial Image
def flip_pixel(x):
	"""
	Flips the pixel to 0 or 1 (depending on which value x takes).
	Input = An integer(x) representing a pixel in the image.
	Output = An integer representing the flipped pixel

	For example:
	>>> x = 1
	>>> flip_pixel(x)
	0

	>>> x = 0
	>>> flip_pixel(x)
	1

        
	The question requires us to code a function to perform a binary 'flip' (e.g. 1 to 0 and vice versa).
	As it is pretty much straightforward, all i did was code an if-else statement, and depending on which value
	x takes, the function will return its 'flipped' value.

	"""
	if x == 1:
		return 0
	else:
		return 1

def modified_list(i,x):
        """
        Function takes a list of binary values, and flips one of it depending on the user-inputed index.
        Input = A list of integers(x) representing the image and an integer (i) representing the position (ie index)
        of the pixel.
        Output = A list of integers(x) representing the modified image.

        For example:
        >>> x = [1,0,1,1,0,0,0]
        >>> i = 2
        >>> modified_list(i,x)
        [1, 0, 0, 1, 0, 0, 0]

        >>> x = [1,0,0,0,0,0,0]
        >>> i = 1
        >>> modified_list(i,x)
        [1, 1, 0, 0, 0, 0, 0]

        This question is similar to the previous question, but here we are dealing with a list instead of a single value/pixel.
        To make things easy, i called the flip_pixel() function to flip the value at the specific index i, store it in x[i] (to
        ensure that the change are "saved"), before returning the now modified x list.
        """
        x[i] = flip_pixel(x[i])
        return x

def compute_difference(x1,x2):
        """
        A function to compute the total absolute difference between the adversarial image and the original image.
        Input =  A list of integers(x1) representing the input image and a list of integers(x2) representing the adversarial image.
        Output = An integer representing the total absolute difference between the elements of x1 and x2.

        For example:
        >>> x1 = [1,0,1,1,0,0,0]
        >>> x2 = [1,1,1,0,0,0,1]
        >>> compute_difference(x1,x2)
        3

        >>> x1 = [0,0,0,0]
        >>> x2 = [1,1,1,1]
        >>> compute_difference(x1,x2)
        4

        >>> x1 = [1,1,1,1,1,1]
        >>> x2 = [1,1,1,1,1,1]
        >>> compute_difference(x1,x2)
        0

        We are aiming to count the total number of different integers/pixels by comparing two lists with the same size.
        I initially declared two values: count and i which will act as the "counter" and index variables respectively.
        Next, i used a while-loop to compare the values of index 0 in both x1 and x2, and if they are different, increment both the counter and
        index variables by 1; else just increment the index variable.

        Finally, the function returns the count variable as an output.

        """
        count,i = 0,0
        while i < len(x1):
                if x1[i] != x2[i]:
                        count += 1
                        i += 1
                else:
                        i += 1
        return count

      
def select_pixel(x,w,b):
        """
        A function that selects a pixel to be flipped based on its overall impact on the output list of the ANN.
            
        Input = A list of inputs(x), a list of tables of weights(w) and a table of biases(b)
        Output = An integer(i) either representing the pixel that is selected to be flipped,or with value -1
        representing no further modifications can be made.

        For example:
        >>> x = read_image('image.txt')
        >>> w = read_weights('weights.txt')
        >>> b = read_biases('biases.txt')
        >>> pixel = select_pixel(x,w,b)
        >>> pixel
        238
        
        >>> x = modified_list(pixel,x)
        >>> pixel = select_pixel(x,w,b)
        >>> pixel
        210

        Here in the Assignment, we are interested on number 4 and 9, and thus the entire operation will solely focus on these two numbers.
        I began by copying the original image list(x)(to ensure that it is unaffected throughout the whole operation), compute its score via the inference() function from the Assignment 1 solutions, obtain the scores for
        number 4 and 9, and declare empty variables 'impact','pixel' and 'i' respectively.

        I then coded a while-loop, where here, the algorithm will flip one pixel per iteration (via the previously coded flip_pixel() function),
        compute its score, obtain the scores for number 4 and 9, subtract the "temporary" four and nine scores against the "original" four and nine scores,
        store it under tempimpact, and if tempimpact is greater than impact and concurrently the temporary four and nine scores are smaller and greater than
        the original four and nine scores respectively, store the index number as pixel (since the index number can be considered as the pixel) while updating
        the impact variable to the latest one. The loop then resets the copyx list into its original, increment iterator i by 1, and repeat the whole process until
        it obtains a pixel value and return it as an output.

        Since we are interested in the overall impact, which implies that we need the total amount of decrease and increase (as shown on the Assignment Spec),
        I used the abs() function to get rid of any negative values during the loop operation.

        In addition, i believe that the score for four and nine will always be affected (either increase or decrease) when we flip one of the 784 pixels, and since it is technically
        always possible to improve, i did not include -1 in my operation.
        
        """
        copyx = x.copy()
        score = inference(copyx,w,b)
        four, nine = score[4], score[9]
        impact, pixel, i = 0,0,0
        while i < len(copyx):
            copyx[i] = flip_pixel(copyx[i])
            tempscore = inference(copyx,w,b)
            tempfour, tempnine = tempscore[4], tempscore[9]
            tempfourimpact = abs(tempfour - four)
            tempnineimpact = abs(tempnine - nine)
            tempimpact = tempfourimpact + tempnineimpact
            if (tempimpact > impact) and (tempfour < four) and (tempnine > nine):
                pixel = i
                impact = tempimpact
            copyx[i] = flip_pixel(copyx[i])
            i +=1
        return pixel
        


def write_image(x,filename):
        """
        A function that writes the list x into a file with name file_name as a 28x28 image.
        
        Input = A list of integers(x) representing the image and a string(file_name) representing the file name.
        Output = Write out each pixel represented in the list x to a file with the name file_name as a 28x28 image.

        For example:
        >>> x = read_image('image.txt')
        >>> x = modified_list(238,x)
        >>> x = modified_list(210,x)
        >>> write_image(x,'new_image.txt')

        This function is pretty straightforward. I began by declaring a counter variable, open the file, and used a for loop to write one pixel per iteration
        while also incrementing counter by 1. Next, if the counter is 28 (which is the limit for each row), move to the next line and reset the counter to 0
        (in order to maintain its functionality throughout the whole operation). Finally, close the file and the file will be created.
         
        """
        counter = 0
        f = open(filename,'w+')
        for i in x:
            f.write(str(i))
            counter += 1
            if counter == 28:
                f.write('\n')
                counter = 0
        f.close()
            

def adversarial_image(image_file_name, weights_file_name, biases_file_name):
        """
        A function that solves the adversarial image generation task.
    
        Input = A string(ie image_file_name) that corresponds to the image file name, a string(ie weights_file_name) that corresponds to the weights file name
        and a string (ie biases_file_name) that corresponds to the biases file name.
        Output = A list of integers representing the adversarial image or the list [-1] if the algorithm is unsuccessful in finding an adversarial image.

        >>> x1 = read_image('image.txt')
        >>> x2 = adversarial_image('image.txt','weights.txt','biases.txt')
        >>> if x2[0] == -1:
        ...     print('Algorithm failed.')
        ... else:
        ...     write_image(x2,'new_image2.txt')
        ...     q = compute_difference(x1,x2)
        ...     print('An adversarial image is found! Total of ' + str(q) + ' pixels were flipped.')
        ...       
        An adversarial image is found! Total of 2 pixels were flipped.

        I began the operation by  initializing variable pixel to store the pixel to be flipped, and reading the image,weights and biases lists into x,w, and b respectively. I then proceed by copying x and storing it into
        copyx, obtain its score via the inference function from Assignment 1, and obtain the score for number nine.

        Here, since we are interested in "attacking" the original image (ie fooling the algorithm to predict that image 4 is something else), i used a while loop, where, while nine
        does not have the highest score, use select_pixel to obtain the pixel to be flipped, modify the image list by flipping the pixel obtained from select_pixel, recalculate its score,
        and obtain the new score for number nine from the updates score list. The algorithm will keep on repeating these steps until nine have the highest score (ie the algorithm now believes
        that the image is showing number nine).

        Finally, the algorithm returns the updated list (ie copyx)
        """
        pixel = 0
        x = read_image(image_file_name)
        w = read_weights(weights_file_name)
        b = read_biases(biases_file_name)
        copyx = x.copy()
        score = inference(copyx,w,b)
        nine = score[9]
        while nine != max(score):
            pixel = select_pixel(copyx,w,b)
            copyx[pixel] = flip_pixel(copyx[pixel])
            score = inference(copyx,w,b)
            nine = score[9]
        return copyx
            


if __name__ == "__main__":
    import doctest
    doctest.testmod(verbose=True)
