# API Documentation: ETD_db

This document describes the RESTful API endpoints for managing the etds, approvals, publications, and publications tables.

# Table of Contents

* [ETDs](#etds)
* [Approvals](#approvals)
* [Reviews](#reviews)
* [Publications](#publications)


# ETDs

Endpoints for managing ETDs.

## ETDs Endpoints
| Endpoint | Method | Description |
| --- | --- | --- |
| /etds | GET | Retrieve all ETDs |
| /etds/<etd_id> | GET | Retrieve a specific ETD |
| /etds/create | POST | Create a new ETD |
| /etds/update | PUT | Update an existing ETD |
| /etds/delete/<etd_id> | DELETE | Delete an existing ETD |


### Retrieve all ETDs  

**Request**  
GET /etds

**Response**  
```[ 
{
        "document_title": "Exploring the Effectiveness of a Mental Health First Aid Course for Educators in Rural School Districts",
        "document_type": "dissertation",
        "etd_id": 1,
        "fk_accesstype_id": 2,
        "fk_contributor_id": 1,
        "fk_degree_id": 1,
        "graduation_date": "Sun, 01 May 2022 04:00:00 GMT",
        "is_embargo": 1,
        "release_date": "Mon, 01 May 2023 04:00:00 GMT"
    },
    {
        "document_title": "A Quantitative Analysis of the Effects of Nurse-Led Medication Reconciliation on Medication Errors in Hospital Settings",
        "document_type": "thesis",
        "etd_id": 2,
        "fk_accesstype_id": 2,
        "fk_contributor_id": 2,
        "fk_degree_id": 6,
        "graduation_date": "Sun, 01 May 2022 04:00:00 GMT",
        "is_embargo": 1,
        "release_date": "Mon, 01 May 2023 04:00:00 GMT"
    }
]  
```

### Retrieve a specific ETD by etd_id  

**Request**  
GET /etds/1

**Response**  
```
[
     {
        "document_title": "Exploring the Effectiveness of a Mental Health First Aid Course for Educators in Rural School Districts",
        "document_type": "dissertation",
        "etd_id": 1,
        "fk_accesstype_id": 2,
        "fk_contributor_id": 1,
        "fk_degree_id": 1,
        "graduation_date": "Sun, 01 May 2022 04:00:00 GMT",
        "is_embargo": 1,
        "release_date": "Mon, 01 May 2023 04:00:00 GMT"
    }
]
```


### Create a new ETD  

**Request**  
POST / etds/create
JSON
```
{
    "document_title": "Female Characters in Dubliners",
    "document_type": "dissertation",
    "graduation_date":"2024-08-05",
    "is_embargo": "0",
    "release_date": "2025-08-06",
    "fk_accesstype_id": 2,
    "fk_degree_id": 1,
    "fk_contributor_id": 1
}
```
**Response**  
"etds added successfully!"


### Update an existing ETD by etd_id

**Request**  
PUT /etds/update
JSON
```
{
    "etd_id": 18,
    "document_title": "Updated ETD Title",
    "document_type": "dissertation",
    "graduation_date":"2024-08-05",
    "is_embargo": "0",
    "release_date": "2025-08-06",
    "fk_accesstype_id": 2,
    "fk_degree_id": 1,
    "fk_contributor_id": 1
}
```
**Response**  
"etds updated successfully!"


### Delete an existing ETD

**Request**  
DELETE /etds/delete/1

**Response**  
"etds deleted successfully!"

***

# Approvals

Endpoints for managing Approvals.

## Approvals Endpoints
| Endpoint | Method | Description |
| --- | --- | --- |
| /approvals | GET | Retrieve all approval records |
| /approvals/<accept_id> | GET | Retrieve a specific approval record |
| /approvals/create | POST | Create a new approval record |
| /approvals/update | PUT | Update an approval record |
| /approvals/delete/<accept_id> | DELETE | Delete an existing approval record |


### Retrieve all Approvals  

**Request**  
GET /approvals

**Response**  
```[
    {
        "accept_date": "Thu, 07 Apr 2022 04:00:00 GMT",
        "accept_id": 1,
        "fk_etd_coordinator_id": 1,
        "fk_etd_id": 1
    },
    {
        "accept_date": "Thu, 21 Apr 2022 04:00:00 GMT",
        "accept_id": 2,
        "fk_etd_coordinator_id": 3,
        "fk_etd_id": 2
    },
    {
        "accept_date": "Sat, 30 Apr 2022 04:00:00 GMT",
        "accept_id": 4,
        "fk_etd_coordinator_id": 4,
        "fk_etd_id": 4
    },
]  
```

### Retrieve a specific Approval by accept_id  

**Request**  
GET /approvals/1

**Response**  
```
[
     {
        "accept_date": "Thu, 07 Apr 2022 04:00:00 GMT",
        "accept_id": 1,
        "fk_etd_coordinator_id": 1,
        "fk_etd_id": 1
    }
]
```


### Create a new Approval

**Request**  
POST / approvals/create
JSON
```
{
    "accept_date": "2022-04-25",
    "fk_etd_coordinator_id": 2,
    "fk_etd_id":6
}
```
**Response**  
"Approvals added successfully!"


### Update an existing Approval by accept_id

**Request**  
PUT /approvals/update
JSON
```
{
    "accept_id":6,
    "accept_date": "2022-04-30",
    "fk_etd_coordinator_id": 2,
    "fk_etd_id":6
}
```
**Response**  
Approvals updated successfully!"


### Delete an existing Approval

**Request**  
DELETE /approvals/delete/1

**Response**  
"Approvals deleted successfully!"

***

# Reviews

Endpoints for managing Reviews.

## Reviews Endpoints
| Endpoint | Method | Description |
| --- | --- | --- |
| /reviews | GET | Retrieve all review records |
| /reviews/<review_id> | GET | Retrieve a specific review record |
| /reviews/create | POST | Create a new review record |
| /reviews/update | PUT | Update a review record |
| /reviews/delete/<review_id> | DELETE | Delete an existing review record |


### Retrieve all Reviews  

**Request**  
GET /reviews

**Response**  
```[
    {
        "fk_etd_coordinator_id": 1,
        "fk_etd_id": 1,
        "review_complete_date": "Wed, 30 Mar 2022 04:00:00 GMT",
        "review_id": 1,
        "review_start_date": "Tue, 15 Mar 2022 04:00:00 GMT"
    },
    {
        "fk_etd_coordinator_id": 3,
        "fk_etd_id": 2,
        "review_complete_date": "Wed, 20 Apr 2022 04:00:00 GMT",
        "review_id": 2,
        "review_start_date": "Tue, 05 Apr 2022 04:00:00 GMT"
    },
    {
        "fk_etd_coordinator_id": 2,
        "fk_etd_id": 3,
        "review_complete_date": "Wed, 27 Apr 2022 04:00:00 GMT",
        "review_id": 3,
        "review_start_date": "Mon, 25 Apr 2022 04:00:00 GMT"
    },
]  
```

### Retrieve a specific review by review_id  

**Request**  
GET /reviews/1

**Response**  
```
[
     {
        "fk_etd_coordinator_id": 1,
        "fk_etd_id": 1,
        "review_complete_date": "Wed, 30 Mar 2022 04:00:00 GMT",
        "review_id": 1,
        "review_start_date": "Tue, 15 Mar 2022 04:00:00 GMT"
    }
]
```


### Create a new review

**Request**  
POST / reviews/create
JSON
```
{
    "review_start_date":"2022-03-10",
    "review_complete_date": "2022-04-30",
    "fk_etd_coordinator_id": 3,
    "fk_etd_id":10
}
```
**Response**  
"reviews added successfully!"


### Update an existing review by review_id

**Request**  
PUT /reviews/update
JSON
```
{
    "review_id":10,
    "review_start_date":"2023-03-10",
    "review_complete_date": "2023-04-25",
    "fk_etd_coordinator_id": 3,
    "fk_etd_id":10
}
```
**Response**  
reviews updated successfully!"


### Delete an existing review

**Request**  
DELETE /reviews/delete/1

**Response**  
"reviews deleted successfully!"

***

# Publications

Endpoints for managing publications.

## Publications Endpoints
| Endpoint | Method | Description |
| --- | --- | --- |
| /publications | GET | Retrieve all publication records |
| /publications/<publish_id> | GET | Retrieve a specific publication record |
| /publications/create | POST | Create a new publication record |
| /publications/update | PUT | Update a publication record |
| /publications/delete/<accept_id> | DELETE | Delete an existing publication record |


### Retrieve all publications  

**Request**  
GET /publications

**Response**  
```[
    {
        "dsc_record_id": 3172519,
        "fk_etd_coordinator_id": 1,
        "fk_etd_id": 1,
        "pq_record_id": 5678,
        "publish_date": "Wed, 01 Jun 2022 04:00:00 GMT",
        "publish_id": 1
    },
    {
        "dsc_record_id": 3172520,
        "fk_etd_coordinator_id": 3,
        "fk_etd_id": 2,
        "pq_record_id": 5679,
        "publish_date": "Wed, 01 Jun 2022 04:00:00 GMT",
        "publish_id": 2
    },
]  
```

### Retrieve a specific publication by publish_id  

**Request**  
GET /publications/1

**Response**  
```
[
     {
    "dsc_record_id": 3172519,
    "fk_etd_coordinator_id": 1,
    "fk_etd_id": 1,
    "pq_record_id": 5678,
    "publish_date": "Wed, 01 Jun 2022 04:00:00 GMT",
    "publish_id": 1
    }
]
```


### Create a new publication

**Request**  
POST / publications/create
JSON
```
{
    "publish_date":"2022-05-10",
    "dsc_record_id":5550123,
    "pq_record_id": 3312,
    "fk_etd_coordinator_id": 1,
    "fk_etd_id":8
}
```
**Response**  
"publications added successfully!"


### Update an existing publication by accept_id

**Request**  
PUT /publications/update
JSON
```
{
    "publish_id":10,
    "publish_date":"2022-05-30",
    "dsc_record_id":5550124,
    "pq_record_id": 3313,
    "fk_etd_coordinator_id": 3,
    "fk_etd_id":10
}

```
**Response**  
publications updated successfully!"


### Delete an existing publication

**Request**  
DELETE /publications/delete/1

**Response**  
"publications deleted successfully!"
