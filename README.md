# Ruby coding task

This is a coding task given by a company which wanted to see my Ruby backend skills and experience.&nbsp;

There were three sub tasks described below.
&nbsp;
You can find the results of:

- Task 1 at `./task_1`
- Task 2 at `./lib/task_2`
- Task 3 at `./task_3`

The original task description and demo data can be found at `./task_description_and_data`.&nbsp;

You can also find controllers and models that were required to complete these tasks under `./app/controllers` and `./app/models` respectively.&nbsp;

Tests can be found at `./spec/requests`.&nbsp;


## Coding task descriptions

    Your task is to write a rails app for size conversion.

    Different countries and brands use different scales for sizing clothes, for example a US size 4 is generally equivalent to a UK size 8. This is confusing to our customers, who don't always remember the correct conversion and end up buying the wrong sizes. To help them buy the correct size, attempt the following tasks, in order:

    1. write some ruby code to do the conversion. This code should receive as input a starting locale, a size  and a target locale. It should return the size converted from the starting locale to the target locale. For example if those inputs were 'US', '4', 'UK' then the output should be '8' since a US size 4 is equivalent to a UK size 8. Use the attached CSV file to work out what the conversions should be. Sizes in the same column (eg UK 2, US 00, FR 30 etc. ) are equivalent.

    2. create a rails app. It should use the code you wrote in 1. to allow users to perform size conversions. They should be able to access the size conversion functionality in 2 ways:

    - a web page with a form where a user with a browser can input the starting locale, size and target locale and be told the converted size
    - as an api

    3. write some standalone ruby code that has the same interface as your code in 1 (ie it receives as input a starting locale, size and a target locale), but instead of doing the conversion directly, it makes an api call to the app you write in 2.


    When you are done, zip up your code, along with any instructions needed to get it running and send it to me at least 24 hours before your interview date. This shouldn't take more than a few hours.

    Some guidelines:

    - Use as similar level of  care / diligence as you would with production code
    - Don't worry about the visual appearance of the form - it's the least important bit of this app
    - You shouldn't need any gems other than what is included in a fresh rails app (other than as required for your views, testing framework, db drivers etc.)
    - You probably will need to make some assumptions - that's OK! State what they are and we can discuss
    - Don't worry if you can't complete everything. Feel free to stub out bits if you can't complete them
