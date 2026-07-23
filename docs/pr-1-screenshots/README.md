# PR 1 browser test evidence

Tested on 14 July 2026 with:

- Apache Tomcat 11.0.24
- Java 21
- Chrome for Testing 149 controlled through Playwright
- desktop viewport: 1440 x 1000
- mobile viewport: 390 x 844

The browser test covered:

1. opening an empty session cart;
2. adding two products through `POST /cart`;
3. adding the same product twice and checking quantity aggregation;
4. changing the quantity with the rendered cart form;
5. checking the calculated total price;
6. opening the responsive mobile layout;
7. following the checkout link;
8. submitting the checkout form and reaching the success page.

Automated checks completed without browser console or page errors. Maven result: 4 tests, 0 failures, 0 errors.
