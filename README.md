# EMG Prosthetic Hand Project

## 1. Project Implementation

This project aims to develop a prosthetic hand controlled by EMG signals from hand gestures. By collecting EMG data, preprocessing it, extracting relevant features, and applying machine learning and deep learning techniques, the system is designed to classify various hand gestures and control the movements of an artificial arm accordingly. 

The hardware setup consists of:
- **MTM card**: for EMG signal detection.
- **Arduino Uno**: for processing the signal.
- **Servos**: for hand movements, controlled based on classified gestures.

The collected EMG data undergoes filtering and feature extraction, after which machine learning models are trained to classify different hand gestures.

## 2. EMG Dataset

The dataset used in this project was captured using EMG electrodes placed on the forearm muscles of 100 subjects. Each subject performed a set of five finger movements, and the corresponding EMG signals were collected at a sampling rate of 3500 Hz. 

Additionally, a custom dataset was collected to experiment with hand gestures using signals from my hand. This data helped refine the models and improve system accuracy.

## 3. Machine Learning-Based Classification

Several machine learning algorithms were tested, including:
- **Support Vector Machines (SVM)**
- **k-Nearest Neighbors (KNN)**
- **Naive Bayes (NB)**
- **Random Forest (RF)**

### Model Accuracy for Selected Features (3 Hz Low Pass Filter):

- **SVM (RBF)**: 55% (for STD)
- **KNN**: 66% (for VA)
- **Naive Bayes (NB)**: 64% (for MAV)

Feature selection was used to choose the most relevant features for training, leading to optimized performance.

## 4. Deep Learning-Based Classification

To improve accuracy, a **Convolutional Neural Network (CNN)** was implemented alongside wavelet transformation. This allowed for capturing intricate signal patterns, improving the classification accuracy.

Wavelet transformation was particularly useful for handling non-stationary signals, enhancing the ability to classify EMG-based gestures.

## 5. Preprocessing

The preprocessing steps involved several stages:
- **Noise Removal**: Applied bandpass filters ranging from 20 Hz to 500 Hz to eliminate noise.
- **Signal Normalization**: Ensured consistency across the dataset.
- **Segmentation**: The EMG signal was divided into smaller windows for easier processing.
- **Feature Extraction**: Post-segmentation, relevant features were extracted.

After filtering, the data matrix consisted of 1938 rows of signals, which were then used for machine learning model training.

## 6. Used Features

A total of 40 features were used in the project, covering both time-domain and frequency-domain characteristics of the EMG signals.

### Time-Domain Features:
- **Mean Absolute Value (MAV)**: Average absolute value of the EMG signal.
- **Root Mean Square (RMS)**: Reflects motor unit activity.
- **Variance (VAR)**: Power density of the signal.
- **Simple Square Integral (SSI)**: Measures the energy of the signal.
- **Zero Crossing Rate (ZCR)**: Measures how often the signal crosses zero.
- **Waveform Length (WL)**: Measures the complexity of the signal.
- **Slope Sign Change (SSC)**: Counts changes in the signal slope.
- **Difference Variance Version (DVARV)**: Measures variance in signal differences.

### Frequency-Domain Features:
- **Fast Fourier Transform (FFT)**: Converts the signal to the frequency domain.
- **Power Spectral Density (PSD)**: Measures power distribution across frequencies.

### Time-Frequency Domain Features:
- **Wavelet Transformation**: Captures both time and frequency information, enhancing classification.

### Feature Selection Example:
Top four selected features after filtering included SSI from 3 Hz, 30 Hz, 40 Hz, and 50 Hz filters, leading to a 73% accuracy for the KNN model.

## Conclusion

This project successfully implemented a prosthetic hand controlled by EMG signal classification. Through preprocessing, feature extraction, and applying machine learning and deep learning models, high accuracy in gesture classification was achieved. This system can pave the way for future prosthetics and assistive device applications.

