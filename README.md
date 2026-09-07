# Flatness-Filtering-Honeyword-Generation
MSc Computer Engineering thesis on flatness filtering for honeyword generation using CNN
University of Genoa


**Author:** Sona Hosseinzadeh Mahdavi  
**Advisor:** Alessandro Armando  
**Examiner:** Matteo Dell’Amico  
**Year:** 2026

---

## Overview

This repository contains the research materials, experimental
code, results, diagrams, and thesis drafts for the MSc thesis:

**Flatness Filtering for Honeyword Generation**

The thesis investigates whether a neural discriminator can be
reused as a defensive oracle to improve the flatness of honeyword
sets against learned attackers.

The proposed approach applies a hybrid flatness-filtering procedure
during honeyword construction. Candidate honeywords are first
screened individually and then evaluated at the sweetword-set level.
Sets that fail the defined flatness conditions are rejected and
regenerated.

---

## Research Objective

The main objective is to investigate whether existing honeyword
generation techniques can be improved against neural attackers
without modifying the underlying generators.

The study evaluates multiple honeyword generation methods against
character-level CNN attackers and compares their attacker success
rates with the random-guessing baseline.

---

## Main Components

The project contains:

- Honeyword generation methods
- Character-level CNN discriminator
- Defensive flatness oracle
- Candidate-level pre-screening
- Set-level rejection sampling
- Flatness metrics
- Attacker evaluation
- Robustness evaluation
- Experimental results
- Thesis drafts and final thesis

---

## Honeyword Generators

The benchmark includes ten generation methods:

1. Chaffing-by-Tweaking
2. Chaffing-with-Password-Model
3. Chaffing-with-Hybrid-Model
4. HoneyGen Baseline
5. HoneyGen Set-Filter
6. HoneyGen Prescreen-Add
7. HoneyGen Prescreen-Ratio
8. HoneyGen Hybrid-Add
9. HoneyGen Hybrid-Ratio
10. Self-trained GAN

---

## Filtering Approach

The proposed filtering procedure contains two stages.

### 1. Candidate-Level Pre-Screening

Candidate honeywords are compared with the real password using
the defensive CNN oracle.

Two variants are evaluated:

- Additive score band
- Multiplicative score band

### 2. Set-Level Rejection Sampling

A complete sweetword set is evaluated using the oracle.

A set is accepted only when it satisfies the defined flatness
conditions.

Otherwise, the set is discarded and regenerated until acceptance
or until the regeneration limit is reached.

---

## Evaluation

The primary security metric is:

**ASR@t (Attacker Success Rate at guess budget t)**

For a sweetword set containing `k = 20` candidates, the random
guessing baseline is:

`ASR@t = t / k`

The experiments report attacker success at multiple guess budgets,
including ASR@1, ASR@3, and ASR@5.

The primary evaluation uses a CNN attacker, with additional
robustness evaluation using:

- Mixed-corpus CNN
- Frequency-based ranker

---

## Experimental Setup

The experiments use the cleaned RockYou password corpus.

Training-set sizes:

- 2,000
- 5,000
- 10,000

Sweetword set size:

- `k = 20`

The oracle and attacker use disjoint corpora.

The attacker is trained independently and is not used during
the filtering stage.

---

## Repository Structure

```text
.
├── thesis/
│   ├── drafts/
│   └── final/
│
├── src/
│   ├── generators/
│   ├── filtering/
│   ├── models/
│   ├── evaluation/
│   └── utils/
│
├── experiments/
├── results/
├── diagrams/
├── data/
├── references/
└── docs/
```
