{% docs flights %}
Gold table storing comprehensive flight details including schedules, delays, distances, and airport information. 
      Enables analysis of airline operations, on-time performance, and route efficiency.

Flights can have different statuses:

| status         | description                                                               |
|----------------|---------------------------------------------------------------------------|
| scheduled      | The flight is scheduled for departure but has not taken off yet            |
| departed       | The flight has departed from the origin airport and is en route            |
| arrived        | The flight has arrived at the destination airport                           |
| cancelled      | The flight has been cancelled before departure                             |
| diverted       | The flight has been diverted to an alternative airport due to unforeseen circumstances |

{% enddocs %}
