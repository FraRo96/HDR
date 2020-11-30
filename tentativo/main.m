clear all; close all;

image_vector = read_images("..\test_images_1\", "tif");
grayscale_image_vector = grayscale(image_vector);

% Local contrast & sharpness measure
sharpened_image_vector = high_pass_filtering(grayscale_image_vector);
binary_sharpened_iv = best_image_contrast(sharpened_image_vector);

% Brightness measure
normalized_brightness_iv = brightness_measure(grayscale_image_vector);

% W measure: local contrast + brightness
W_normalized = W_measure(binary_sharpened_iv, normalized_brightness_iv);

% HDR image
HDR_image = create_HDR(image_vector, W_normalized);
figure('Name', 'HDR unfiltered'); imshow(HDR_image);
% Filtering
HDR_filtered = imguidedfilter(HDR_image);
figure('Name', 'HDR'); imshow(HDR_filtered);

figure('Name', 'Image 1: Binary Local Best Contrast 1'); imshow(sharpened_image_vector(:,:,1));
figure('Name', 'Image 3: Binary Local Best Contrast 3'); imshow(binary_sharpened_iv(:,:,3));
figure('Name', 'Image 6: Binary Local Best Contrast 6'); imshow(binary_sharpened_iv(:,:,6));
