# JolieDoc for Port SMTP #

## From file `smtp.iol` ##

<table>
 <tbody>
  <tr>
   <th>Port Name</th>
   <th>Location</th>
   <th>Protocol</th>
  </tr>
  <tr>
   <td>SMTP</td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

## List of the available interfaces ##

 *  SMTPInterface 

--------------------

## Interface SMTPInterface ##

<table>
 <tbody>
  <tr>
   <th>Heading</th>
   <th>Input type</th>
   <th>Output type</th>
   <th>Faults</th>
  </tr>
  <tr>
   <td><a rel="nofollow">sendMail</a></td>
   <td><a rel="nofollow">SendMailRequest</a><br></td>
   <td>void<br></td>
   <td>SMTPFault,&nbsp;<br></td>
  </tr>
 </tbody>
</table>

--------------------

## Operation list ##

### sendMail ###

    sendMail( SendMailRequest )( void ) throws
    				SMTPFault

--------------------

## Message type list ##

### SendMailRequest ###

    type SendMailRequest: void { 
        .cc*: string
        .authenticate?: void { 
            .password: string
            .username: string
        }
        .bcc*: string
        .subject: string
        .host: string
        .replyTo*: string
        .from: string
        .to[1,2147483647]: string
        .contentType?: string
        .content: string
    }

--------------------

## Type list ##