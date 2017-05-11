# InstaNetFrame

InstaNetFrame is a networking IOS framework for executing HTTP requests in apps. It has the following features:
- Support for enqueuing requests and executing them in a FIFO order.
- Enqueuing a request should accept a URL, an HTTP verb, and a set parameters.
- Requests should be executed in the background while maintaining thread-safety.

- Once a request is done, the enqueuer should be notified and the response object should be passed to it.

- Requests should continue to run when app goes to the background.

- Requests should run concurrently based on network condition. If device is on cellular connection, number of concurrent requests should be restricted to 2, while Wi-Fi should execute up to 6simultaneous requests. mkd
- Include at least 5 unit tests that cover different classes/methods of your framework.
