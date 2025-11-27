# BGRG Norwegian Website Content Extraction Summary

## Overview
Successfully extracted Norwegian text content from 5 HTML pages of the Bergen Giardia Research Group (BGRG) website.

## Source Files
- **Page392.htm** (Bakgrunn - Background)
- **Page449.htm** (Forskningsprosjekter - Research Projects)
- **Page545.htm** (Involverte Forskere - Involved Researchers)
- **Page625.htm** (BGRG & Publikasjoner - BGRG & Publications)
- **Page722.htm** (Nyheter & Lenker - News & Links)

**Location:** `/home/helge/HELGES-LOKALE-RAIL-KUBERNETES-REPO/uib-org/docs/bgrg/BGRGwebsiteN_files/`

## Extraction Details

### File Format & Encoding
- **Original Encoding:** ISO-8859-1 (Latin-1)
- **Output Encoding:** UTF-8
- **Output File:** `NORWEGIAN_CONTENT_EXTRACTED.txt` (28 KB, 630 lines)

### Content Extracted

#### 1. Bakgrunn (Background)
- Overview of the 2004 Giardia waterborne outbreak in Bergen
- Infection details (5-6000 persons infected)
- Initial symptoms and treatment
- Post-infection complications (functional dyspepsia, IBS, chronic fatigue)
- Contact information

#### 2. Forskningsprosjekter (Research Projects)
- Kindergarten outbreak investigations (2010)
- Post-giardiasis IBS and functional dyspepsia mechanisms
- Long-term prevalence studies (3, 6, and 10 years post-infection)
- Metronidazole resistance research
- Vaccine development investigations
- Publication list reference

#### 3. Involverte Forskere (Involved Researchers)
- Professor Trygve Hausken (gastroenterology)
- Professor Guri Rørtveit (epidemiology)
- Overlege Vernesa Dizdar (gastroenterology specialist)
- Førsteamanuensis Kurt Hanevik (infectious diseases specialist)
- Professor Nina Langeland (infectious diseases)
- Overlege Kristine Mørch (tropical infectious diseases)
- Forsker Knut Arne Wensaas (general practice research)
- International partners (Lucy Robertson, Staffan Svärd, Beate Niesler)
- Graduate students and research fellows

#### 4. BGRG & Publikasjoner (BGRG & Publications)
- Group description and mission statement
- Comprehensive publication list (51 published studies)
- Research output from 2006-2023
- Focus areas: giardiasis, post-infectious complications, genetic factors

#### 5. Nyheter & Lenker (News & Links)
- PhD thesis defenses and dates (2010-2022)
- Media appearances and coverage
- Research awards (2017 Bergen kommune award)
- Bellygenes project collaboration (2017)
- Timeline of research activities and milestones
- Related links and resources

## Data Quality

### Cleaned Elements
- Removed navigation menus
- Removed contact headers and footers
- Removed duplicate section headings
- Removed HTML markup and styling

### Preserved Elements
- All main body text in Norwegian
- Proper Norwegian character encoding (æ, ø, å)
- Publication citations
- Researcher names and affiliations
- Timeline information
- Research project descriptions

## File Location
```
/home/helge/HELGES-LOKALE-RAIL-KUBERNETES-REPO/uib-org/docs/bgrg/NORWEGIAN_CONTENT_EXTRACTED.txt
```

## Use Cases
This extracted content is suitable for:
- Creating Norwegian language documentation
- Building a modernized BGRG website
- Content migration projects
- Research documentation
- Knowledge base creation
- Translation reference materials

---
**Extraction Date:** November 27, 2025
**Extraction Method:** HTML parsing with ISO-8859-1 to UTF-8 conversion
