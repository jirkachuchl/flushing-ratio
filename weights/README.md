# 🌲 YOLOv11 Segmentation Model – Norway Spruce Spring Phenology

Instance segmentation model for detecting **Norway spruce crowns** and **spruce buds** in phenological imagery.

This repository provides:

- ✅ Trained YOLOv11 segmentation weights  
- ✅ Training configuration details  
- ✅ Evaluation metrics  
- ✅ Google Colab training & inference notebook  

---

## 📦 Model Overview

This model was trained using **YOLOv11 (Ultralytics)** for instance segmentation on a custom dataset hosted on Roboflow:

🔗 Dataset:  
https://universe.roboflow.com/poseestimationpines/spring_phenology_norway_spruce

### Classes

- `norway-spruce`
- `spruce-bud`

---

## 🧠 Dataset

| Split | Images | Percentage |
|-------|--------|------------|
| Train | 2508   | 93%        |
| Valid | 188    | 7%         |

The dataset contains annotated phenocam-style imagery of *Picea abies* during spring phenological development.

---

## 🔧 Preprocessing (Roboflow)

The following preprocessing steps were applied:

- **Auto-Orient**
- **Resize**: Stretch to 640×640
- **Modify Classes**: 5 remapped, 2 dropped

---

## 🔄 Data Augmentation

Each training example produced **3 augmented outputs**.

Augmentations applied:

- Horizontal Flip
- Vertical Flip
- 90° Rotation (clockwise, counter-clockwise, upside-down)
- Random Rotation (-15° to +15°)
- Crop (0–30% zoom)
- Shear (±10° horizontal and vertical)
- Saturation (-25% to +25%)
- Brightness (-15% to +15%)
- Exposure (-10% to +10%)
- Blur (up to 2.5 px)
- Noise (up to 1.5% of pixels)

---

## 🏋️ Training

The model was trained using **Ultralytics YOLOv11** in a **Google Colab notebook**.

The training notebook is available in this repository:

## 📊 Evaluation Metrics

### Segmentation Model Performance (Validation Set)

Bounding-box metrics describe object detection performance.  
Mask metrics describe instance segmentation performance.  
mAP@0.5 is reported at IoU threshold = 0.5.

| Class | Box Precision | Box Recall | Box mAP@0.5 | Mask Precision | Mask Recall | Mask mAP@0.5 |
|-------|--------------|------------|-------------|----------------|-------------|--------------|
| **All** | 0.830 | 0.752 | 0.822 | 0.764 | 0.686 | 0.718 |
| **Norway-spruce** | 0.842 | 0.678 | 0.786 | 0.706 | 0.561 | 0.593 |
| **Spruce-bud** | 0.817 | 0.826 | 0.858 | 0.822 | 0.810 | 0.842 |

### Metric Definitions

- **Precision** – proportion of predicted positives that are correct.  
- **Recall** – proportion of ground-truth objects correctly detected.  
- **mAP@0.5** – mean Average Precision at Intersection-over-Union (IoU) threshold of 0.5.  
- **Box** metrics refer to bounding-box detection performance.  
- **Mask** metrics refer to instance segmentation performance.


