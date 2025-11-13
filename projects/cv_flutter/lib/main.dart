import 'package:flutter/material.dart';

void main() {
  runApp(const CVApp());
}

class CVConstants {
  static const a4Ratio = 297 / 210;
  static const leftColumnWidth = 0.35;
  static const photoSizeRatio = 0.16;
  static const headerHeightRatio = 0.11;
  static const topSpacingRatio = 0.23;
}

// Theme personalizado para CV
class CVTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      fontFamily: 'Lato',
    );
  }

  static const ColorScheme _colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF23232A),
    onPrimary: Colors.white,
    secondary: Color(0xFFE7E8E6),
    onSecondary: Color(0xFF23232A),
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Color(0xFF23232A),
    surfaceContainerHighest: Color(0xFFE7E8E6),
    outline: Color(0xFFC7C8CA),
    outlineVariant: Color(0xFF464A4E),
  );

  static const TextTheme _textTheme = TextTheme(
    // Header name
    displayLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 28,
      fontWeight: FontWeight.bold,
      letterSpacing: 3,
    ),
    // Header title
    displayMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w300,
    ),
    // Section titles
    titleLarge: TextStyle(
      fontFamily: 'Century Gothic',
      fontSize: 14,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
    // Reference name
    titleMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    // Body text
    bodyLarge: TextStyle(
      fontFamily: 'Lato',
      fontSize: 11,
      height: 1.4,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
    // Education items
    bodySmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 10,
    ),
    // Labels and small text
    labelLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 9,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 9,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 8,
      height: 1.5,
    ),
  );
}

class CVApp extends StatelessWidget {
  const CVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CVTheme.theme,
      home: const CVScreen(),
    );
  }
}

class CVScreen extends StatefulWidget {
  const CVScreen({super.key});

  @override
  State<CVScreen> createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final dimensions = CVDimensions.calculate(constraints);
            
            return SingleChildScrollView(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CVDocument(dimensions: dimensions),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CVDimensions {
  final double width;
  final double height;
  final double photoSize;
  final double headerHeight;
  final double topSpacing;

  CVDimensions({
    required this.width,
    required this.height,
    required this.photoSize,
    required this.headerHeight,
    required this.topSpacing,
  });

  static CVDimensions calculate(BoxConstraints constraints) {
    double width, height;

    if (constraints.maxHeight / constraints.maxWidth > CVConstants.a4Ratio) {
      width = constraints.maxWidth * 0.9;
      height = width * CVConstants.a4Ratio;
    } else {
      height = constraints.maxHeight * 0.95;
      width = height / CVConstants.a4Ratio;
    }

    return CVDimensions(
      width: width,
      height: height,
      photoSize: height * CVConstants.photoSizeRatio,
      headerHeight: height * CVConstants.headerHeightRatio,
      topSpacing: height * CVConstants.topSpacingRatio,
    );
  }
}

class CVDocument extends StatelessWidget {
  final CVDimensions dimensions;

  const CVDocument({super.key, required this.dimensions});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimensions.width,
      height: dimensions.height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LeftSidebar(dimensions: dimensions),
              MainContent(dimensions: dimensions),
            ],
          ),
          CVHeader(dimensions: dimensions),
          ProfilePhoto(dimensions: dimensions),
        ],
      ),
    );
  }
}

class LeftSidebar extends StatelessWidget {
  final CVDimensions dimensions;

  const LeftSidebar({super.key, required this.dimensions});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return SizedBox(
      width: dimensions.width * CVConstants.leftColumnWidth,
      child: Container(
        color: theme.colorScheme.surfaceContainerHighest,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              dimensions.width * 0.04,
              dimensions.topSpacing,
              dimensions.width * 0.04,
              dimensions.height * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(title: 'ABOUT ME', width: dimensions.width),
                SizedBox(height: dimensions.height * 0.012),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  textAlign: TextAlign.justify,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: dimensions.height * 0.028),
                
                SectionTitle(title: 'EDUCATION', width: dimensions.width),
                SizedBox(height: dimensions.height * 0.012),
                EducationItem(
                  degree: 'Bachelor of Business Management',
                  institution: 'Wardiere University',
                  years: '2016 - 2020',
                  dimensions: dimensions,
                ),
                SizedBox(height: dimensions.height * 0.022),
                EducationItem(
                  degree: 'Bachelor of Business Management',
                  institution: 'Wardiere University',
                  years: '2020 - 2023',
                  dimensions: dimensions,
                ),
                SizedBox(height: dimensions.height * 0.028),
                
                SectionTitle(title: 'SKILLS', width: dimensions.width),
                SizedBox(height: dimensions.height * 0.012),
                ...['Management Skills', 'Creativity', 'Digital Marketing', 
                    'Negotiation', 'Critical Thinking', 'Leadership']
                    .map((skill) => SkillItem(
                          skill: skill,
                          level: 0.8,
                          dimensions: dimensions,
                        )),
                SizedBox(height: dimensions.height * 0.028),
                
                SectionTitle(title: 'LANGUAGE', width: dimensions.width),
                SizedBox(height: dimensions.height * 0.012),
                LanguageItem(language: 'English', dimensions: dimensions),
                SizedBox(height: dimensions.height * 0.01),
                LanguageItem(language: 'Spain', dimensions: dimensions),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  final CVDimensions dimensions;

  const MainContent({super.key, required this.dimensions});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              dimensions.width * 0.06,
              dimensions.topSpacing,
              dimensions.width * 0.06,
              dimensions.height * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContactInfo(dimensions: dimensions),
                SizedBox(height: dimensions.height * 0.035),
                
                MainSectionTitle(title: 'EXPERIENCE', dimensions: dimensions),
                SizedBox(height: dimensions.height * 0.025),
                
                ExperienceItem(
                  period: '2020 - 2023',
                  title: 'Product Design Manager',
                  company: 'Arowwai Industries | 123 Anywhere St., Any City',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet sem nec risus egestas accumsan. In enim nunc, tincidunt ut quam eget, luctus sollicitudin neque. Sed leo nisl, semper ac hendrerit a, sollicitudin in arcu.',
                  dimensions: dimensions,
                ),
                SizedBox(height: dimensions.height * 0.002),
                ExperienceItem(
                  period: '2019 - 2020',
                  title: 'Marketing Manager',
                  company: 'Arowwai Industries | 123 Anywhere St., Any City',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet sem nec risus egestas accumsan. In enim nunc, tincidunt ut quam eget, luctus sollicitudin neque. Sed leo nisl, semper ac hendrerit a, sollicitudin in arcu.',
                  dimensions: dimensions,
                ),
                SizedBox(height: dimensions.height * 0.002),
                ExperienceItem(
                  period: '2017 - 2019',
                  title: 'Marketing Manager',
                  company: 'Arowwai Industries | 123 Anywhere St., Any City',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet sem nec risus egestas accumsan. In enim nunc, tincidunt ut quam eget, luctus sollicitudin neque. Sed leo nisl, semper ac hendrerit a, sollicitudin in arcu.',
                  dimensions: dimensions,
                ),
                SizedBox(height: dimensions.height * 0.002),
                ExperienceItem(
                  period: '2016 - 2017',
                  title: 'Marketing Manager',
                  company: 'Arowwai Industries | 123 Anywhere St., Any City',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet sem nec risus egestas accumsan. In enim nunc, tincidunt ut quam eget, luctus sollicitudin neque.',
                  dimensions: dimensions,
                ),
                
                SizedBox(height: dimensions.height * 0.03),
                
                MainSectionTitle(title: 'REFERENCES', dimensions: dimensions),
                SizedBox(height: dimensions.height * 0.025),
                
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ReferenceItem(
                        name: 'Harumi Kobayashi',
                        position: 'Wardiere Inc. / CEO',
                        phone: '123-456-7890',
                        email: 'hello@reallygreatsite.com',
                        dimensions: dimensions,
                      ),
                    ),
                    SizedBox(width: dimensions.width * 0.05),
                    Expanded(
                      child: ReferenceItem(
                        name: 'Bailey Dupont',
                        position: 'Wardiere Inc. / CEO',
                        phone: '123-456-7890',
                        email: 'hello@reallygreatsite.com',
                        dimensions: dimensions,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CVHeader extends StatelessWidget {
  final CVDimensions dimensions;

  const CVHeader({super.key, required this.dimensions});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Positioned(
      top: dimensions.height * 0.045 + 
           (dimensions.photoSize / 2) - 
           (dimensions.headerHeight / 2),
      left: (dimensions.width * CVConstants.leftColumnWidth) / 2,
      right: 0,
      child: Container(
        height: dimensions.headerHeight,
        color: theme.colorScheme.primary,
        padding: EdgeInsets.only(
          left: dimensions.photoSize / 2 + dimensions.width * 0.03,
          right: dimensions.width * 0.04,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'LORNA ALVARADO',
                style: theme.textTheme.displayLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
            SizedBox(height: dimensions.height * 0.003),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Marketing Manager',
                style: theme.textTheme.displayMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  final CVDimensions dimensions;

  const ProfilePhoto({super.key, required this.dimensions});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: dimensions.height * 0.045,
      left: (dimensions.width * CVConstants.leftColumnWidth - 
             dimensions.photoSize) / 2,
      child: Container(
        width: dimensions.photoSize,
        height: dimensions.photoSize,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.surface,
            width: 8,
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/images/profile.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final double width;

  const SectionTitle({super.key, required this.title, required this.width});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        SizedBox(width: width * 0.015),
        Expanded(
          child: Transform.translate(
            offset: Offset(width * 0.06, 0),
            child: Container(
              height: 1,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class MainSectionTitle extends StatelessWidget {
  final String title;
  final CVDimensions dimensions;

  const MainSectionTitle({
    super.key,
    required this.title,
    required this.dimensions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        SizedBox(width: dimensions.width * 0.06),
        Expanded(
          child: Container(
            height: 1,
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

class EducationItem extends StatelessWidget {
  final String degree;
  final String institution;
  final String years;
  final CVDimensions dimensions;

  const EducationItem({
    super.key,
    required this.degree,
    required this.institution,
    required this.years,
    required this.dimensions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          degree,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 9,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
            height: 1.4,
          ),
        ),
        SizedBox(height: dimensions.height * 0.004),
        Text(
          institution,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 9.8,
            color: theme.colorScheme.primary,
            height: 1.4,
          ),
        ),
        SizedBox(height: dimensions.height * 0.004),
        Text(
          years,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 8.8,
            color: theme.colorScheme.primary,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

class SkillItem extends StatelessWidget {
  final String skill;
  final double level;
  final CVDimensions dimensions;

  const SkillItem({
    super.key,
    required this.skill,
    required this.level,
    required this.dimensions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: EdgeInsets.only(bottom: dimensions.height * 0.012),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              skill,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          SizedBox(width: dimensions.width * 0.015),
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  height: dimensions.width * 0.006,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.outline,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: level,
                  child: Container(
                    height: dimensions.width * 0.006,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LanguageItem extends StatelessWidget {
  final String language;
  final CVDimensions dimensions;

  const LanguageItem({
    super.key,
    required this.language,
    required this.dimensions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        Container(
          width: dimensions.width * 0.008,
          height: dimensions.width * 0.008,
          margin: EdgeInsets.only(right: dimensions.width * 0.01),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.primary,
          ),
        ),
        Text(
          language,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 11,
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

class ContactInfo extends StatelessWidget {
  final CVDimensions dimensions;

  const ContactInfo({super.key, required this.dimensions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ContactInfoIcon(
              icon: Icons.phone,
              text: '+123-456-7890',
              dimensions: dimensions,
            ),
            SizedBox(width: dimensions.width * 0.04),
            ContactInfoIcon(
              icon: Icons.laptop,
              text: 'www.reallygreatsite.com',
              dimensions: dimensions,
            ),
          ],
        ),
        SizedBox(height: dimensions.height * 0.014),
        Row(
          children: [
            ContactInfoIcon(
              icon: Icons.email,
              text: 'hello@reallygreatsite.com',
              dimensions: dimensions,
            ),
            SizedBox(width: dimensions.width * 0.04),
            ContactInfoIcon(
              icon: Icons.location_on,
              text: '123     Anywhere     St.,     Any City, ST 12345',
              dimensions: dimensions,
            ),
          ],
        ),
      ],
    );
  }
}

class ContactInfoIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final CVDimensions dimensions;

  const ContactInfoIcon({
    super.key,
    required this.icon,
    required this.text,
    required this.dimensions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(dimensions.width * 0.006),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
            ),
            child: Icon(
              icon,
              size: dimensions.width * 0.012,
              color: theme.colorScheme.onPrimary,
            ),
          ),
          SizedBox(width: dimensions.width * 0.008),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.primary,
              ),
              overflow: TextOverflow.visible,
              softWrap: true,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String period;
  final String title;
  final String company;
  final String description;
  final CVDimensions dimensions;

  const ExperienceItem({
    super.key,
    required this.period,
    required this.title,
    required this.company,
    required this.description,
    required this.dimensions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: dimensions.width * 0.011,
              height: dimensions.width * 0.011,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: theme.colorScheme.primary,
                  width: 1,
                ),
              ),
            ),
            Container(
              width: 1,
              height: dimensions.height * 0.09,
              color: theme.colorScheme.primary,
            ),
          ],
        ),
        SizedBox(width: dimensions.width * 0.018),
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
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(width: dimensions.width * 0.02),
                  Text(
                    period,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              SizedBox(height: dimensions.height * 0.003),
              Text(
                company,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: dimensions.height * 0.008),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      '•',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[700],
                        height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      description,
                      textAlign: TextAlign.justify,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ReferenceItem extends StatelessWidget {
  final String name;
  final String position;
  final String phone;
  final String email;
  final CVDimensions dimensions;

  const ReferenceItem({
    super.key,
    required this.name,
    required this.position,
    required this.phone,
    required this.email,
    required this.dimensions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        SizedBox(height: dimensions.width * 0.004),
        Text(
          position,
          style: theme.textTheme.bodySmall?.copyWith(
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: dimensions.width * 0.01),
        _buildContactDetail(context, 'Phone: ', phone),
        SizedBox(height: dimensions.width * 0.004),
        _buildContactDetail(context, 'Email: ', email),
      ],
    );
  }

  Widget _buildContactDetail(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 7,
            height: 1.5,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.outlineVariant,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 8,
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}