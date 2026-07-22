---
type: UI Design Manifest
title: Result-grid relationships
description: Source-independent guidance for a static result region with repeated entries.
status: draft
source: mixed
scope: Static result-grid region only
---

# Guidance

The result region separates its own scan path from adjacent refinement and contextual regions. A concise region header introduces a vertically repeated set of result entries.

Within each entry, the record title is the primary reading target. Supporting context and compact metadata remain associated with that title while carrying lower visual priority. A marker may be associated with an entry only when its meaning is supplied by the application owner.

The repeated entry structure is a result-to-field relationship: a region header introduces a set of entries, and each entry groups its title, supporting context, metadata, and any permitted marker as one record presentation.

# Unresolved

- Product meaning and display copy for every slot.
- Record identity, data source, aggregate information, empty or loading states, and update triggers.
- Refinement behavior, submitted-condition relationship, sorting, pagination, and responsive behavior.
- Marker meaning, display condition, and update trigger.
- Whether a record has a destination and whether that destination may be displayed or invoked.

# Relationships

Application requires the bounded [Application Input Contract](application-input-contract.md). Neutral values are limited by the [fixture trace](fixture-trace.md), and no application may treat the review-only [extraction and evaluation record](extraction-evaluation-record.md) as an input.
