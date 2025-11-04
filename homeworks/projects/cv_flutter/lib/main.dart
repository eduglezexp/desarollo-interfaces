import 'package:flutter/material.dart';

void main() {
  runApp(const CVApp());
}

class CVApp extends StatelessWidget {
  const CVApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CVScreen(),
    );
  }
}

class CVScreen extends StatelessWidget {
  const CVScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            const a4Ratio = 297 / 210;
            
            double width, height;
            
            if (constraints.maxHeight / constraints.maxWidth > a4Ratio) {
              width = constraints.maxWidth * 0.9;
              height = width * a4Ratio;
            } else {
              height = constraints.maxHeight * 0.95;
              width = height / a4Ratio;
            }
            
            return SingleChildScrollView(
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Header negro con nombre
                    Container(
                      width: double.infinity,
                      color: const Color(0xFF3D4F5C),
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.08,
                        vertical: height * 0.035,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LORNA ALVARADO',
                            style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: height * 0.008),
                          Text(
                            'Marketing Manager',
                            style: TextStyle(
                              fontSize: width * 0.016,
                              letterSpacing: 2,
                              color: Colors.white70,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Contenido (sidebar + main)
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Columna izquierda (sidebar)
                          SizedBox(
                            width: width * 0.35,
                            child: Container(
                              color: const Color(0xFFE7E8E6),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height * 0.03),
                                    // Foto de perfil
                                    Center(
                                      child: Container(
                                        width: width * 0.18,
                                        height: width * 0.18,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 6,
                                          ),
                                        ),
                                        child: ClipOval(
                                          child: Icon(
                                            Icons.person,
                                            size: width * 0.09,
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: height * 0.04),
                                    
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // About Me
                                          _buildSectionTitle('ABOUT ME', width),
                                          SizedBox(height: height * 0.012),
                                          _buildDarkText(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                            width: width,
                                          ),
                                          SizedBox(height: height * 0.035),
                                          
                                          // Education
                                          _buildSectionTitle('EDUCATION', width),
                                          SizedBox(height: height * 0.012),
                                          _buildDarkText('Bachelor of Business Management', width: width, bold: true),
                                          SizedBox(height: height * 0.003),
                                          _buildDarkText('Wardiere University', width: width),
                                          SizedBox(height: height * 0.003),
                                          _buildDarkText('2016 - 2020', width: width),
                                          SizedBox(height: height * 0.018),
                                          _buildDarkText('Bachelor of Business Management', width: width, bold: true),
                                          SizedBox(height: height * 0.003),
                                          _buildDarkText('Wardiere University', width: width),
                                          SizedBox(height: height * 0.003),
                                          _buildDarkText('2020 - 2023', width: width),
                                          SizedBox(height: height * 0.035),
                                          
                                          // Skills
                                          _buildSectionTitle('SKILLS', width),
                                          SizedBox(height: height * 0.012),
                                          _buildSkillItem('Management Skills', width),
                                          _buildSkillItem('Creativity', width),
                                          _buildSkillItem('Digital Marketing', width),
                                          _buildSkillItem('Negotiation', width),
                                          _buildSkillItem('Critical Thinking', width),
                                          _buildSkillItem('Leadership', width),
                                          SizedBox(height: height * 0.035),
                                          
                                          // Language
                                          _buildSectionTitle('LANGUAGE', width),
                                          SizedBox(height: height * 0.012),
                                          Row(
                                            children: [
                                              Container(
                                                width: width * 0.008,
                                                height: width * 0.008,
                                                margin: EdgeInsets.only(right: width * 0.01),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFF2C3E50),
                                                ),
                                              ),
                                              _buildDarkText('English', width: width),
                                            ],
                                          ),
                                          SizedBox(height: height * 0.008),
                                          Row(
                                            children: [
                                              Container(
                                                width: width * 0.008,
                                                height: width * 0.008,
                                                margin: EdgeInsets.only(right: width * 0.01),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFF2C3E50),
                                                ),
                                              ),
                                              _buildDarkText('Spain', width: width),
                                            ],
                                          ),
                                          SizedBox(height: height * 0.04),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          
                          // Columna derecha (contenido principal)
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    width * 0.06,
                                    height * 0.025,
                                    width * 0.06,
                                    height * 0.03,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Información de contacto
                                      Row(
                                        children: [
                                          _buildContactInfoIcon(Icons.phone, '+123-456-7890', width),
                                          SizedBox(width: width * 0.04),
                                          _buildContactInfoIcon(Icons.language, 'www.reallygreatsite.com', width),
                                        ],
                                      ),
                                      SizedBox(height: height * 0.012),
                                      Row(
                                        children: [
                                          _buildContactInfoIcon(Icons.email, 'hello@reallygreatsite.com', width),
                                          SizedBox(width: width * 0.04),
                                          _buildContactInfoIcon(Icons.location_on, '123 Anywhere St., Any City, ST 12345', width),
                                        ],
                                      ),
                                      SizedBox(height: height * 0.035),
                                      
                                      // Experience
                                      _buildMainSectionTitle('EXPERIENCE', width),
                                      SizedBox(height: height * 0.02),
                                      
                                      _buildExperienceItem(
                                        '2020 - 2023',
                                        'Product Design Manager',
                                        'Arowwai Industries | 123 Anywhere St., Any City',
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet sem nec risus egestas accumsan. In enim nunc, tincidunt ut quam eget, luctus sollicitudin neque. Sed leo nisl, semper ac hendrerit a, sollicitudin in arcu.',
                                        width,
                                        height,
                                      ),
                                      SizedBox(height: height * 0.022),
                                      
                                      _buildExperienceItem(
                                        '2019 - 2020',
                                        'Marketing Manager',
                                        'Arowwai Industries | 123 Anywhere St., Any City',
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet sem nec risus egestas accumsan. In enim nunc, tincidunt ut quam eget, luctus sollicitudin neque. Sed leo nisl, semper ac hendrerit a, sollicitudin in arcu.',
                                        width,
                                        height,
                                      ),
                                      SizedBox(height: height * 0.022),
                                      
                                      _buildExperienceItem(
                                        '2017 - 2019',
                                        'Marketing Manager',
                                        'Arowwai Industries | 123 Anywhere St., Any City',
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet sem nec risus egestas accumsan. In enim nunc, tincidunt ut quam eget, luctus sollicitudin neque. Sed leo nisl, semper ac hendrerit a, sollicitudin in arcu.',
                                        width,
                                        height,
                                      ),
                                      SizedBox(height: height * 0.022),
                                      
                                      _buildExperienceItem(
                                        '2016 - 2017',
                                        'Marketing Manager',
                                        'Arowwai Industries | 123 Anywhere St., Any City',
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet sem nec risus egestas accumsan. In enim nunc, tincidunt ut quam eget, luctus sollicitudin neque.',
                                        width,
                                        height,
                                      ),
                                      SizedBox(height: height * 0.035),
                                      
                                      // References
                                      _buildMainSectionTitle('REFERENCES', width),
                                      SizedBox(height: height * 0.02),
                                      
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: _buildReferenceItem(
                                              'Harumi Kobayashi',
                                              'Wardiere Inc. / CEO',
                                              '123-456-7890',
                                              'hello@reallygreatsite.com',
                                              width,
                                            ),
                                          ),
                                          SizedBox(width: width * 0.05),
                                          Expanded(
                                            child: _buildReferenceItem(
                                              'Bailey Dupont',
                                              'Wardiere Inc. / CEO',
                                              '123-456-7890',
                                              'hello@reallygreatsite.com',
                                              width,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  
  Widget _buildSectionTitle(String title, double width) {
    return Text(
      title,
      style: TextStyle(
        fontSize: width * 0.014,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: const Color(0xFF2C3E50),
      ),
    );
  }
  
  Widget _buildDarkText(String text, {required double width, bool bold = false}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: width * 0.0115,
        color: const Color(0xFF2C3E50),
        height: 1.4,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
  
  Widget _buildSkillItem(String skill, double width) {
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.01),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              skill,
              style: TextStyle(
                fontSize: width * 0.0115,
                color: const Color(0xFF2C3E50),
              ),
            ),
          ),
          SizedBox(width: width * 0.015),
          Expanded(
            flex: 4,
            child: Container(
              height: width * 0.006,
              decoration: BoxDecoration(
                color: const Color(0xFF2C3E50),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildContactInfoIcon(IconData icon, String text, double width) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(width * 0.006),
            decoration: BoxDecoration(
              color: const Color(0xFF2C3E50),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Icon(
              icon,
              size: width * 0.012,
              color: Colors.white,
            ),
          ),
          SizedBox(width: width * 0.008),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: width * 0.011,
                color: const Color(0xFF2C3E50),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildMainSectionTitle(String title, double width) {
    return Text(
      title,
      style: TextStyle(
        fontSize: width * 0.018,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: const Color(0xFF2C3E50),
      ),
    );
  }
  
  Widget _buildExperienceItem(String period, String title, String company, String description, double width, double height) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: width * 0.011,
              height: width * 0.011,
              margin: EdgeInsets.only(top: height * 0.004),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF2C3E50),
                  width: 2,
                ),
              ),
            ),
            Container(
              width: 2,
              height: height * 0.08,
              color: Colors.grey[300],
            ),
          ],
        ),
        SizedBox(width: width * 0.018),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: width * 0.014,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2C3E50),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Text(
                    period,
                    style: TextStyle(
                      fontSize: width * 0.011,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.003),
              Text(
                company,
                style: TextStyle(
                  fontSize: width * 0.011,
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: height * 0.008),
              Text(
                description,
                style: TextStyle(
                  fontSize: width * 0.011,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildReferenceItem(String name, String position, String phone, String email, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: width * 0.014,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2C3E50),
          ),
        ),
        SizedBox(height: width * 0.004),
        Text(
          position,
          style: TextStyle(
            fontSize: width * 0.011,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: width * 0.01),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone: ',
              style: TextStyle(
                fontSize: width * 0.01,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            Expanded(
              child: Text(
                phone,
                style: TextStyle(
                  fontSize: width * 0.01,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: width * 0.004),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email: ',
              style: TextStyle(
                fontSize: width * 0.01,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            Expanded(
              child: Text(
                email,
                style: TextStyle(
                  fontSize: width * 0.01,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}