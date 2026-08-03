# eDöner - Online Ordering System

A Java-based web application for ordering traditional döner kebabs online. Built with Jakarta EE, JSP, JSTL, and Maven.

## Features

- **Product Menu**: Browse and order from our döner menu with detailed descriptions and pricing
- **Shopping Cart**: Add/remove items, adjust quantities, view totals
- **Order Management**: Delivery address, contact information, order confirmation
- **Responsive Design**: Mobile-friendly interface for all device sizes
- **Order Tracking**: View order history and confirmation details
- **Contact Form**: Direct customer communication channel

## Requirements

- **Java**: JDK 17 or higher
- **Apache Tomcat**: Version 11 or higher (with Jakarta EE support)
- **Maven**: 3.8.0 or higher (or use included Maven wrapper)
- **Database**: Not required (uses in-memory session storage)

## Project Setup

### 1. Clone the Repository

```bash
git clone https://github.com/dhbw-web-se2/eDoener.git
cd eDoener
```

### 2. Build the Project

Using Maven wrapper (recommended):
```bash
./mvnw clean install
```

Or with Maven (if installed globally):
```bash
mvn clean install
```

This will:
- Compile Java sources
- Run unit tests
- Package as WAR file

### 3. Deploy to Tomcat

#### Option A: Using Tomcat Manager (GUI)
1. Start Tomcat server
2. Navigate to http://localhost:8080/manager/html
3. Upload the WAR file from `target/eDoener-1.0-SNAPSHOT.war`
4. Access the application at http://localhost:8080/eDoener

#### Option B: Manual Deployment
1. Copy the WAR file:
```bash
cp target/eDoener-1.0-SNAPSHOT.war $CATALINA_HOME/webapps/eDoener.war
```

2. Restart Tomcat:
```bash
$CATALINA_HOME/bin/shutdown.sh
$CATALINA_HOME/bin/startup.sh
```

3. Access at http://localhost:8080/eDoener

## Running Tests

```bash
./mvnw test
```

Current test coverage:
- CartBean: 4 tests
- MenuBean: 2 tests
- Total: 6 tests (all passing)

## Directory Structure

```
eDoener/
├── src/
│   ├── main/
│   │   ├── java/de/uni/doener/
│   │   │   ├── model/          # Bean classes (CartBean, MenuBean, OrderBean)
│   │   │   └── servlet/        # Request handlers (CartServlet, CheckoutServlet)
│   │   └── webapp/
│   │       ├── CSS/            # Stylesheets
│   │       ├── js/             # JavaScript files
│   │       ├── images/         # Logo, map, product images
│   │       ├── homepage.jsp    # Main entry point
│   │       ├── menu.jsp        # Product menu
│   │       ├── cart.jsp        # Shopping cart
│   │       ├── checkout.jsp    # Order form
│   │       └── contact.jsp     # Contact form
│   └── test/                   # Unit tests
├── pom.xml                     # Maven configuration
└── mvnw                        # Maven wrapper
```

## Key Pages

| Page | URL | Purpose |
|------|-----|---------|
| Homepage | `/homepage.jsp` | Landing page with restaurant info |
| Menu | `/menu` | Browse all available products |
| Cart | `/cart` | View and manage shopping cart |
| Checkout | `/checkout` | Place order with delivery details |
| Contact | `/homepage.jsp#contact` | Send message to restaurant |
| Impressum | `/impressum.jsp` | Legal information |

## Technology Stack

- **Backend**: Jakarta EE, Servlets
- **Frontend**: JSP, JSTL, HTML5, CSS3
- **Build Tool**: Maven
- **Server**: Apache Tomcat 11
- **Session Storage**: HttpSession (in-memory)

## Troubleshooting

### Port Already in Use
If port 8080 is busy, change Tomcat port in `$CATALINA_HOME/conf/server.xml`:
```xml
<Connector port="8081" ... />
```

### Maven Wrapper Permission Denied
If you see "Permission denied" when running `./mvnw`:
```bash
bash mvnw clean install
```

### Application Not Found
Ensure:
1. WAR file is deployed in `$CATALINA_HOME/webapps`
2. Tomcat has restarted after deployment
3. Access via correct path: `http://localhost:8080/eDoener`

## Development Notes

- Session data is not persisted; restarting Tomcat will clear all carts and orders
- Email is sent to console only (not actually delivered)
- Images should be in JPG/PNG format for optimal performance
- All text uses UTF-8 encoding with German special characters

## Future Enhancements

- Database persistence
- Payment processing integration
- Email notifications
- Real-time order tracking
- Admin dashboard
- Image optimization

## License

DHBW Webengineering Project

## Contact

For questions or support, contact: info@edoener.de

