# Descriptions of tidy dataset 

## Variables (Columns)
### subjects
subjects are numbered from 1 to 30.
### activities
six activities are listed in order as follows:

1. WALKING

2. WALKING_UPSTAIRS

3. WALKING_DOWNSTAIRS

4. SITTING

5. STANDING

6. LAYING

Note that the activity names are converted to lower case and underscores are removed as column name rules required. The combination of 30 subjects and 6 activities gives us 180 columns. For example, `3standing` represents the `STANDING` activity of 3rd subject; `28walkingupstairs` means the `WALKING_UPSTAIRS` activity of 28th subject, etc.

## Observations (Rows)
### `t` and `f`
The prefix `t` and `f` stands for time domain and frequency domain signals respectively.

### `body` and `gravity`
The acceleration signal is separated into body and gravity acceleration signals.

### `acc` and `gyro`
`acc` and `gyro` indicate the data obtained from accelerometer or gyroscope.

### `jerk`
`jerk` means the time derivative of signals.  

### `mag`
The magnitude of three-dimensional signals were calculated using the Euclidean norm.

### `mean` and `std`
The signal is mean value or standard deviation.

### `x`, `y` and `z`
`x`, `y` and `z` denote 3-axial signals in X, Y and Z directions.
