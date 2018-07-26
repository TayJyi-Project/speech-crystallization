import os
import re
import librosa
maxlen = 0
dir1 = './hawa/'
dir2 = './kp/'
list1 = os.listdir(dir1)
list2 = os.listdir(dir2)
list1 = sorted(list1)
list2 = sorted(list2)
print(len(list1), len(list2))

for i in range(len(list1)):
    [x, fs] = librosa.load(dir1 + list1[i])
    [y, fs] = librosa.load(dir2 + list2[i])
    if(x.size < y.size):
        print(dir1+list1[i], '<', dir2+list2[i])
