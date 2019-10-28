BEGIN TRANSACTION;

INSERT INTO countries (
                          country_code,
                          country_name,
                          continent
                      )
                      VALUES (
                          'CA',
                          'Canada',
                          'Amérique'
                      ),
                      (
                          'DE',
                          'Allemagne',
                          'Europe'
                      ),
                      (
                          'FR',
                          'France',
                          'Europe'
                      ),
                      (
                          'GB',
                          'Angleterre',
                          'Europe'
                      ),
                      (
                          'IN',
                          'Inde',
                          'Asie'
                      ),
                      (
                          'JP',
                          'Japon',
                          'Asie'
                      ),
                      (
                          'KR',
                          'Corée',
                          'Asie'
                      ),
                      (
                          'MX',
                          'Méxique',
                          'Amérique'
                      ),
                      (
                          'RU',
                          'Russie',
                          'Asie'
                      ),
                      (
                          'US',
                          'Etats-Unis',
                          'Amérique'
                      );

COMMIT TRANSACTION ; 
