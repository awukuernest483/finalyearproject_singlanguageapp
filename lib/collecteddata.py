# Import necessary libraries
import os
import cv2

# Create a video capture object to read frames from the webcam (camera index 0)
cap = cv2.VideoCapture(0)

# Specify the directory where images will be saved
directory = '/Users/ernestawuku/Documents/final_year_project_docs/signlanguagedatasets/asl_alphabet_train'

# Create the directory if it does not exist
if not os.path.exists(directory):
    os.makedirs(directory)

# Initialize a dictionary to keep track of the count of images saved for each sign/gesture
count = {
    'a': len(os.listdir(directory + "A")),
    'b': len(os.listdir(directory + "B")),
    'c': len(os.listdir(directory + "C")),
    'd': len(os.listdir(directory + "D")),
    'del': len(os.listdir(directory + "del")),
    'e': len(os.listdir(directory + "E")),
    'f': len(os.listdir(directory + "F")),
    'g': len(os.listdir(directory + "G")),
    'h': len(os.listdir(directory + "H")),
    'i': len(os.listdir(directory + "I")),
    'j': len(os.listdir(directory + "J")),
    'k': len(os.listdir(directory + "K")),
    'l': len(os.listdir(directory + "L")),
    'm': len(os.listdir(directory + "M")),
    'n': len(os.listdir(directory + "N")),
    'nothing': len(os.listdir(directory + "nothing")),
    'o': len(os.listdir(directory + "O")),
    'p': len(os.listdir(directory + "P")),
    'q': len(os.listdir(directory + "Q")),
    'r': len(os.listdir(directory + "R")),
    's': len(os.listdir(directory + "S")),
    'space': len(os.listdir(directory + "space")),
    't': len(os.listdir(directory + "T")),
    'u': len(os.listdir(directory + "U")),
    'v': len(os.listdir(directory + "V")),
    'w': len(os.listdir(directory + "W")),
    'x': len(os.listdir(directory + "X")),
    'y': len(os.listdir(directory + "Y")),
    'z': len(os.listdir(directory + "Z"))
}

while True:
    # Read a frame from the webcam
    _, frame = cap.read()

    # Get the count of images saved for each sign/gesture
    # The count dictionary helps in creating unique filenames for each new image
    # For example, if there are 5 images saved for "A" already, the next image will be named "A5.jpg"
    # The counts are incremented for each corresponding sign whenever a new image is saved
    count = {
        'a': len(os.listdir(directory + "A")),
        'b': len(os.listdir(directory + "B")),
        'c': len(os.listdir(directory + "C")),
        'd': len(os.listdir(directory + "D")),
        'del': len(os.listdir(directory + "del")),
        'e': len(os.listdir(directory + "E")),
        'f': len(os.listdir(directory + "F")),
        'g': len(os.listdir(directory + "G")),
        'h': len(os.listdir(directory + "H")),
        'i': len(os.listdir(directory + "I")),
        'j': len(os.listdir(directory + "J")),
        'k': len(os.listdir(directory + "K")),
        'l': len(os.listdir(directory + "L")),
        'm': len(os.listdir(directory + "M")),
        'n': len(os.listdir(directory + "N")),
        'nothing': len(os.listdir(directory + "nothing")),
        'o': len(os.listdir(directory + "O")),
        'p': len(os.listdir(directory + "P")),
        'q': len(os.listdir(directory + "Q")),
        'r': len(os.listdir(directory + "R")),
        's': len(os.listdir(directory + "S")),
        'space': len(os.listdir(directory + "space")),
        't': len(os.listdir(directory + "T")),
        'u': len(os.listdir(directory + "U")),
        'v': len(os.listdir(directory + "V")),
        'w': len(os.listdir(directory + "W")),
        'x': len(os.listdir(directory + "X")),
        'y': len(os.listdir(directory + "Y")),
        'z': len(os.listdir(directory + "Z"))
    }

    # Extract a region of interest (ROI) from the frame
    # This ROI is the area inside the rectangle where the sign/gesture will be captured
    row = frame.shape[1]
    col = frame.shape[0]
    cv2.rectangle(frame, (0, 40), (300, 400), (255, 255, 255), 2)
    cv2.imshow("data", frame)
    cv2.imshow("ROI", frame[40:400, 0:300])
    frame = frame[40:400, 0:300]

    # Resize the frame to 200x200 (for consistent image size)
    frame = cv2.resize(frame, (200, 200))

    # Convert the color space of the frame to RGB (necessary for saving images in correct format)
    frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)

    # Wait for a key press event with a timeout of 1 millisecond
    key = cv2.waitKey(1)

    # Check if a key press event occurred
    if key != -1:
        # Convert the key code to a lowercase character
        key_char = chr(key).lower()

        # Check if the key character corresponds to any sign/gesture in the 'count' dictionary
        if key_char in count:
            # Create the filename for the new image based on the sign/gesture and its count
            filename = f"{directory}{key_char.upper()}/{key_char.upper()}{str(count[key_char])}.jpg"

            # Save the current frame as an image with the specified filename
            # The JPEG quality is set to 100 (highest quality) to avoid lossy compression
            cv2.imwrite(filename, frame, [cv2.IMWRITE_JPEG_QUALITY, 100])

        # If the key character is '1', break the loop and stop capturing images
        elif key_char == '1':
            break

# Release the video capture object and close OpenCV windows
cap.release()
cv2.destroyAllWindows()
