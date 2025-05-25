  

# The answers to the 5 questions are given below in Bengali.

### 1. What is PostgreSQL?

**উত্তরঃ**  *PostgreSQL* একটি জনপ্রিয়, শক্তিশালী ওপেন সোর্স রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (RDMS) । এটি SQL (Structured Query Language) ব্যবহার করে ডেটা পুনরুদ্ধার এবং বিশ্লেষণ করার সুযোগ দেয়। এটি ACID গুণাবলি সমর্থন করে, যা ডেটাবেসের নির্ভরযোগ্যতা এবং নিরাপত্তা নিশ্চিত করে। PostgreSQL এ ট্রিগার, স্টোরড প্রোসিজার, জটিল কুয়েরি, JSON সাপোর্ট, এবং অনেক ধরনের ডেটা টাইপ থাকে।

**উদাহরণ:** একটি `students` টেবিলে সব শিক্ষার্থীর নাম ও বয়স রাখা যায় এবং পরে কুয়েরি করে সেগুলোর তথ্য দেখা যায়।
<br/>
<br/>
##
<br/>

### 2. What is the purpose of a database schema in PostgreSQL?

**উত্তরঃ** PostgreSQL-এ **ডাটাবেস  স্কিমা (Schema)** হলো একটি **লজিক্যাল কাঠামো** , যা ডাটাবেসের মধ্যে টেবিল, ভিউ, ফাংশন, সিকোয়েন্স, ইত্যাদি সংগঠিত করে রাখে। এটি একপ্রকার "ফোল্ডার" এর মতো কাজ করে যা ডাটাবেসের ভেতরের অবজেক্টগুলোকে তার নির্দিষ্ট জায়গায় গুছিয়ে রাখে।

### **ডাটাবেস স্কিমার উদ্দেশ্য:** 

 - **ডেটার সংগঠন** 

 > স্কিমা ব্যবহার করে ডেটা গুলো  টেবিল, ভিউ ইত্যাদি আলাদা আলাদা ক্যাটাগরিতে রাখা যায় । যেমন 
 
একটি ডেটাবেস আছে `wildlife_db` নামে।  তারপর এতে ২টি স্কিমা দিলাম   

```markdown
    CREATE SCHEMA research;
    CREATE SCHEMA operations;
 ```   
 
 দুইটি টেবিল তৈরি করলাম, কিন্তু সেগুলো আলাদা স্কিমায়
 ```markdown
 CREATE TABLE research.species_data (
      species_id SERIAL PRIMARY KEY,
      name VARCHAR(100)
    );
    CREATE TABLE operations.rangers (
      ranger_id SERIAL PRIMARY KEY,
      name VARCHAR(100)
    );
 ```
 
*একই ডেটাবেইসে দুইটি ভিন্ন উদ্দেশ্যের টেবিল আলাদাভাবে সংরক্ষণ করা যাচ্ছে ।*

 
 - **নামের বিবাদ এড়ানো**

> একই নামের টেবিল বা অবজেক্ট আলাদা স্কিমায় রাখা যায় যাতে সেগুলো পরে পরস্পরের সাথে দ্বন্দ্ব বা বিবাদ তৈরী করতে না পারে।
 
 - **সিকিউরিটি ও পারমিশন নিয়ন্ত্রণ**
> ডাটাবেস স্কিমা-ভিত্তিক access control দেয়া যায়,কে কোন ডাটাবেস স্কিমা অ্যাক্সেস করতে পারবে তা নির্ধারণ করা যায় ।

*ডাটাবেস স্কিমা ডেটাগুলো সুশৃঙ্খলভাবে গুছিয়ে রাখে , নিরাপত্তা নিশ্চিত করে তাই এটি  বড় প্রজেক্ট বা মাল্টি-ইউজার সিস্টেমে অত্যন্ত গুরুত্বপূর্ণ।*
 <br/>
 <br/>
 ##
 <br/>

### 3. What is the difference between the `VARCHAR` and `CHAR` data types?

**উত্তরঃ**  
### `VARCHAR` ও `CHAR` ডেটা টাইপের পার্থক্য:

 **VARCHAR**

 - `VARCHAR`  মানে **Variable Character**।
 
 - এটি ভ্যারিয়েবল দৈর্ঘ্যের স্ট্রিং ডেটা সংরক্ষণ করে।
 
 - এটির স্ট্রিং-এর দৈর্ঘ্য **পরিবর্তনশীল** করা যায় ।
 
 - যত ক্যারেক্টার লেখা হয় , শুধু সেটার জায়গা ব্যবহার করে।

 - এটি বেশি স্পেস ব্যবহার করে না, তাই স্পেস অপচয় হয় না।

 - এটি স্ট্যান্ডার্ড text input field-এর  জন্য। 
 
 - এটি ডাটাবেস এ ব্যবহারের ক্ষেত্রে  খুবই জনপ্রিয়।

 - **উদাহরণ:** `name VARCHAR(20);`



**CHAR**

- এইখানে `CHAR` মানে **Fixed Character**।

- এটি নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং Character সংরক্ষণ করে।

- এটি **নির্দিষ্ট দৈর্ঘ্যের** হওয়ায় সব ইনপুট নির্দিষ্ট দৈর্ঘ্যে পৌঁছানোর জন্য খালি ইনপুট স্পেস দিয়ে পূর্ণ করে ।

- ছোট নির্দিষ্ট ডেটাতে এটা ব্যবহার করলে ভালো পারফরমেন্স রেজাল্ট দেয় ।

- ডেটার দৈর্ঘ্য সবসময় একরকম হলে এটি ভালো অপশন।

- কোড, স্টেটাস, ইউনিফর্ম ফিল্ড ইত্যাদিতে `CHAR` ব্যবহার হয় ।

- **উদাহরণ:**
 `code CHAR(5)`  
> ৩টা  ক্যারেক্টার  এ ইনপুট দিলে বাকি ২তা স্পেস দিয়ে পূরণ করবে ।
<br/>
<br/>

##
<br/>

### 4.  Explain the *Primary Key* and *Foreign Key* concepts in PostgreSQL?

**উত্তরঃ**  PostgreSQL-এ **Primary Key** এবং **Foreign Key** ব্যবহার করা হয় ডেটা সংরক্ষণের জন্য । নিচে **Primary Key** এবং **Foreign Key** এর সম্পর্কে দেয়া হলো:

### **Primary Key**

 - **`Primary Key`** একটি বা একাধিক কলাম যা প্রতিটি রেকর্ডকে একক ভাবে শনাক্ত করে।
 
 - প্রতিটি টেবিলে **একটি মাত্র `Primary Key`** থাকতে পারে।
 - **`Primary Key`** **NULL হতে পারে না** (NOT NULL বাধ্যতামূলক)।
 
 - প্রতিটি মান অবশ্যই **একক** হতে হবে।

 - **`Primary Key`**  নির্দিষ্ট রেকর্ড বের করার জন্য ব্যবহার হয়।

 - এক বা একাধিক কলাম মিলিয়ে **`Primary Key`** তৈরি করা যায় যেমন (Composite Key)।
 
 - **উদাহরণ:** 
`CREATE TABLE rangers (  ranger_id SERIAL PRIMARY KEY, name VARCHAR(100), region VARCHAR(100) );`

> এখানে **ranger_id** হচ্ছে **Primary Key**। যার কারণে প্রতিটি রেঞ্জারকে আলাদা করে চিনতে সহজ হয় ।


### **Foreign Key**

 - **Foreign Key** একটি টেবিলের কলামকে অন্য টেবিলের **Primary Key** এর সাথে যুক্ত করে।
 
 
 -  ডেটার **ইন্টিগ্রিটি** বজায় রাখে যেন ভুল রেফারেন্স না থাকে।
 
 
 - **Foreign Key** এর  কলামে থাকা মান অবশ্যই Parent টেবিলে থাকতে হবে।
 
 
 - এটি **one-to-many** বা **many-to-one** সম্পর্ক তৈরি করতে সাহায্য করে।
 
 
 - এটা একক হয় না । ডুপ্লিকেট থাকতে পারে ।
 
 

 - **উদাহরণ:** 
```markdown 
 CREATE TABLE sightings (
  sighting_id SERIAL PRIMARY KEY,
  species_id INT REFERENCES species(species_id),
  ranger_id INT REFERENCES rangers(ranger_id),
  location VARCHAR(100),
  sighting_time TIMESTAMP
);
```

> এখানে `ranger_id` এবং `species_id` হলো **Foreign Key**।এগুলো `rangers`
> এবং `species` টেবিলের **Primary Key** কে রেফার করছে।

<br/>
<br/>

##
<br/>

### 5. How can you modify data using `UPDATE` statements?
 
 **উত্তরঃ**  
 `UPDATE` statement ব্যবহার করে PostgreSQL-এ বিদ্যমান টেবিলের এক বা একাধিক রেকর্ডের ডেটা পরিবর্তন করা যায়। এটি **SET** ক্লজের মাধ্যমে নির্দিষ্ট কলামের মান আপডেট করে এবং **WHERE** ক্লজ ব্যবহার করে কাকে আর কোথায় আপডেট করতে হবে সেটা নির্ধারণ করে।

### **`UPDATE` statement-এর গঠন**

```markdown
    UPDATE table_name
    SET column1 = new_value1,
        column2 = new_value2,
        ...
    WHERE condition;
 ```    

   
**উদাহরণ:**
   
   

 - **একটি টেবিলের একটি রেকর্ড আপডেট**
 
 ধরি `rangers` নামে একটি টেবিল আছে:
 
```markdown
| ranger_id | name             | region         |
|-----------|------------------|--------------- |
| 1         | Alice Green      | Northern Hills |
| 2         | Bob White        | River Delta    |
```    

> যদি  Bob White-এর region পরিবর্তন করতে চাই Desert Plains দিয়ে তাহলে `UPDATE` statement দিতে হবে

```markdown
    UPDATE rangers
    SET region = 'Desert Plains'
    WHERE name = 'Bob White';
```   
এখানে কেবলমাত্র `Bob White`-এর রেকর্ড আপডেট হয়েছে। 

<br/>
<br/>
 
 - **একসাথে একাধিক কলাম আপডেট**
 `UPDATE` statement দিয়ে একসাথে একাধিক কলাম আপডেট করা যায়।
 ```markdown
 UPDATE rangers
SET name = 'Robert White', region = 'Eastern Forest'
WHERE ranger_id = 2;
```

*এখানে `ranger_id = 2` এর নাম ও অঞ্চল দুইটাই একসাথে পরিবর্তন হয়েছে।*


<br/>
<br/>

 - **একাধিক রেকর্ড আপডেট করা যায় condition দিয়ে**
 
  ধরি `species` নামে একটি টেবিল আছে:
 ```markdown
| species_id | common_name       | scientific_name         | discovery_date | conservation_status |
|------------|-------------------|-------------------------|----------------|---------------------|
| 1          | Snow Leopard      | Panthera uncia          | 1775-01-01     | Endangered          |
| 2          | Bengal Tiger      | Panthera tigris tigris  | 1758-01-01     | Endangered          |
| 3          | Red Panda         | Ailurus fulgens         | 1825-01-01     | Vulnerable          |
| 4          | Asiatic Elephant  | Elephas maximus indicus | 1758-01-01     | Endangered          |

```

##### যদি এইখানে `conservation_status` `UPDATE` করতে চাই  তাহলে

```markdown
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';
```

##### এখানে যেসব species 1800 সালের আগে আবিষ্কৃত হয়েছে, তাদের `conservation_status` আপডেট হয়ে গেছে `'Historic'` হিসেবে।

<br/>


> যদি `WHERE` ক্লজ না দেয় 
>  UPDATE rangers SET region = 'Unknown'; 
>  তাহলে সব রেঞ্জার-এর region হয়ে যাবে 'Unknown' , কোনো নির্দিষ্ট region পরিবর্তন হবে না। তাই `WHERE` ক্লজ  ব্যবহার করতে হবে।

<br/>
<br/>


*অবশেষে  বলতে পারি , `UPDATE` হলো একটি শক্তিশালী এবং বেশি ব্যবহারযোগ্য **SQL** কমান্ড যা বিদ্যমান রেকর্ডের মান পরিবর্তনের জন্য ব্যবহৃত হয়।     এটি **SET** দিয়ে কোন মান আপডেট হবে এবং **WHERE** দিয়ে কাকে আপডেট করতে হবে — তা স্পষ্টভাবে নির্ধারণ করে ।*