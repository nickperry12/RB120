# You've Got Mail!

# Can you decipher and fix the error that the following code produces?

class Mail
  def to_s
    "#{self.class}"
  end
end

class Email < Mail
  attr_accessor :subject, :body

  def initialize(subject, body)
    @subject = subject
    @body = body
  end
end

class Postcard < Mail
  attr_reader :text

  def initialize(text)
    @text = text
  end
end

module Mailing
  def receive(mail, sender)
    mailbox << mail unless reject?(sender)
  end

  # Change if there are sources you want to block.
  def reject?(sender)
    false
  end

  def send(destination, mail)
    "Sending #{mail} from #{name} to: #{destination}"
    # Omitting the actual sending.
  end
end

class CommunicationsProvider
  attr_reader :name, :account_number

  def initialize(name, account_number=nil)
    @name = name
    @account_number = account_number
  end
end

class EmailService < CommunicationsProvider
  include Mailing

  attr_accessor :email_address, :mailbox

  def initialize(name, account_number, email_address)
    super(name, account_number)
    @email_address = email_address
    @mailbox = []
  end

  def empty_inbox
    self.mailbox = []
  end
end

class TelephoneService < CommunicationsProvider
  def initialize(name, account_number, phone_number)
    super(name, account_number)
    @phone_number = phone_number
  end
end

class PostalService < CommunicationsProvider
  include Mailing

  attr_accessor :street_address, :mailbox

  def initialize(name, street_address)
    super(name)
    @street_address = street_address
    @mailbox = []
  end

  def change_address(new_address)
    self.street_address = new_address
  end
end

rafaels_email_account = EmailService.new('Rafael', 111, 'Rafael@example.com')
johns_phone_service   = TelephoneService.new('John', 122, '555-232-1121')
johns_postal_service  = PostalService.new('John', '47 Sunshine Ave.')
ellens_postal_service = PostalService.new('Ellen', '860 Blackbird Ln.')

puts johns_postal_service.send(ellens_postal_service.street_address, Postcard.new('Greetings from Silicon Valley!'))
# => undefined method `860 Blackbird Ln.' for #<PostalService:0x00005571b4aaebe8> (NoMethodError), error ocurs on line 95

# Solution

=begin
The error is originating from line 95, where we are attempting to call the
`send` method on the object `johns_postal_service` (an object of the
`PostalService` class). The error being thrown is a `NoMethodError`, stating
that there is no `860 Blackbird Ln.'` method defined for the `PostalService`
object. When we look within the `PostalService` class we can see that their is
no `send` method defined within it; the method is defined within the `Mailing`
module, which has not been mixed in to the `PostalService` class. Ruby then
looks up the inheritance chain, where it will find a `send` method within the
built-in `Object` class. This method accepts a method name for an argument and
then calls that method on the calling object. Here it is attempting to call `860
Blackbird Ln.'`, a method that does not exist anywhere in our code (it's a
string value assigned to the instance variable `@street_address`). 

To fix this, we can mix in the `Mailing` module into the `PostalServices` class.
  We can mix it in using the `include` key word followed by the module name.
=end