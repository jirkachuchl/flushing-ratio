## 📊 Statistical Analysis
---

## 🌍 Genotype × Environment Interaction (Type-B Genetic Correlation)

Genotype-by-environment interaction (G×E) was evaluated using a linear mixed model (LMM) fitted in **ASReml-R**:

$$
y = X\beta + Zu + e
$$

where:

- $y$ – vector of phenotypic observations  
- $\beta$ – vector of fixed effects (overall mean, site, population within site)  
- $u$ – vector of random genetic effects nested within site  
- $e$ – vector of residuals  
- $X$ and $Z$ – incidence matrices relating observations to fixed and random effects  

Random genetic effects followed:

$$
u \sim N(0, G)
$$

with variance–covariance structure:

$$
G =
\begin{bmatrix}
\sigma_{gS_1}^2 & \sigma_{gS_1S_2} \\
\sigma_{gS_1S_2} & \sigma_{gS_2}^2
\end{bmatrix}
\otimes I
$$

where:

- $\sigma_{gS_1}^2$ – genetic variance at Site 1  
- $\sigma_{gS_2}^2$ – genetic variance at Site 2  
- $\sigma_{gS_1S_2}$ – genetic covariance between sites  
- $I$ – identity matrix  

Residuals followed:

$$
e \sim N(0, R)
$$

with spatial structure:

$$
R =
\begin{bmatrix}
\sigma_{\xi S_1}^2 \left[AR1_{col} \otimes AR1_{row}\right] & 0 \\
0 & \sigma_{\xi S_2}^2 \left[AR1_{col} \otimes AR1_{row}\right]
\end{bmatrix}
$$

where:

- $\sigma_{\xi S_1}^2$, $\sigma_{\xi S_2}^2$ – spatial residual variances  
- $AR1_{col}$ and $AR1_{row}$ – first-order autoregressive correlation structures in rows and columns  

---

## 🔁 Genetic Correlations Between Traits or Years (Type-A)

To assess consistency between traits (or repeated measures across years), a bivariate mixed model was fitted:

$$
y = X\beta + Zu + e
$$

Genetic variance–covariance structure:

$$
G =
\begin{bmatrix}
\sigma_{gT_1}^2 & \sigma_{gT_1T_2} \\
\sigma_{gT_1T_2} & \sigma_{gT_2}^2
\end{bmatrix}
\otimes I
$$

where:

- $\sigma_{gT_1}^2$, $\sigma_{gT_2}^2$ – genetic variances for trait (or age) 1 and 2  
- $\sigma_{gT_1T_2}$ – genetic covariance between traits (or years)  

Residuals followed:

$$
e \sim N(0, R)
$$

with spatial structure:

$$
R =
\begin{bmatrix}
\sigma_{eT_1}^2 & \sigma_{eT_1T_2} \\
\sigma_{eT_1T_2} & \sigma_{eT_2}^2
\end{bmatrix}
\otimes I
$$

where:

- $\sigma_{\e T_1}^2$, $\sigma_{\e T_2}^2$ – residual variances at trait (or age) 1 and trait (or age) 2
- $\sigma_{\e T_1T_2}$ – residual covariances between trait (or age) 1 and trait (or age) 2
- $I$ - identity matrix


---

## 🧪 Significance Testing

- Site effects were evaluated using the **Wald test** (approximate F-test).  
- Genetic parameters (heritability and genetic correlations) were tested using **Likelihood Ratio Tests (LRT)**, comparing full models with reduced models where the tested parameter was constrained to zero.


Broad-sense heritability ($H^2$) was calculated as:

$$
H^2 = \frac{\sigma_g^2}{\sigma_p^2}
$$

where:

- $\sigma_g^2$ – total genetic variance  
- $\sigma_p^2$ – total phenotypic variance estimated from the fitted model

---

When both experimental sites were analyzed jointly, $H^2$ was calculated as:

$$
H^2 = \frac{\left(\sigma_{gS_1}^2 + \sigma_{gS_2}^2\right)}{\left(\sigma_{gS_1}^2 + \sigma_{gS_2}^2 + \sigma_{eS_1}^2 + \sigma_{eS_2}^2\right)}
$$


where:

- $\sigma_{g_{S_1}}^2$ – genetic variance at Site 1  
- $\sigma_{g_{S_2}}^2$ – genetic variance at Site 2  
- $\sigma_{e_{S_1}}^2$ – residual (environmental) variance at Site 1  
- $\sigma_{e_{S_2}}^2$ – residual (environmental) variance at Site 2  
