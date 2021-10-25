# Create Courses
# COURSES
puts 'Inserting Courses...'.colorize(:green)
course = Course.find_or_create_by(name: 'KPI Hunters - Full Stack STARTUP', description: 'Desenvolvimento de sistemas e aplicativos e negócios')
periods = [
  {name: 'Pré-Curso', icon: 'fal fa-book-reader'},
  {name: 'Educação Financeira', icon: 'fal fa-funnel-dollar'},
  {name: 'StartUps', icon: 'fal fa-alicorn'},
  {name: 'Programação', icon: 'fal fa-code'},
  {name: 'Ciência de Dados', icon: 'fal fa-analytics'},
  {name: 'Marketing Digital', icon: 'fal fa-bullseye-pointer'},
  {name: 'IoT (Eletrônica)', icon: 'fal fa-microchip'},
  {name: 'CBL (Desafios)', icon: 'fal fa-volcano'},
]
periods.each_with_index do |period, i|
  period[:sort_position] = i
  course.periods << Period.find_or_create_by(period)
end

lessons = [
  # Pre-Course (about roadmap & start)
  [
    {name: 'Sobre o curso e seus módulos', icon: 'fal fa-graduation-cap', description: 'Como funcionam os módulos e quais são os objetivos de capacitação de cada módulo e o porquê da ordem dos módulos.', video_id: 'BPbCLtBl_g4', playlist_id: 'PLPJvRB7ImtVPzF5BNMKtEVSHKBqt2i9cg'},
    {name: 'Operador de Micro', icon: 'fas fa-laptop', description: 'Como funcionam nossos canais de comunicação (Canal NEWS Telegram, GRUPO Telegram, Canais temáticos do Slack).'},
    {name: 'Intro IMPORTANTE (português e trabalho)', icon: 'fas fa-exclamation-triangle', description: 'O porquê é tão importante você saber português e como você deve se melhorar sua escrita, interpretação de texto e comunicação interpessoal.'},
    {name: 'Vocacional', icon: 'far fa-network-wired', description: 'Como escolher qual frente de estudo intensificar os esforços para obter o melhor resultado pelo seu perfil.'},
    {name: 'Como é o Trabalho', icon: 'fal fa-network-wired', description: 'Como funciona o trabalho na área de tecnologia e em empresas modernas e ágeis; Como é e o que é o SCRUM, Kanban, Lean Stratup; Como será o trabalho nos projetos da KPI Hunters, seus parceiros e demais empresas.'},
    {name: 'Comunicação (Slack+Telegram)', icon: 'fal fa-comments', description: 'Como funcionam nossos canais de comunicação (Canal NEWS Telegram, GRUPO Telegram, Canais temáticos do Slack).'},
    {name: 'Metodologia Científica', icon: 'fal fa-flask-potion', description: 'Como funciona a ciência e o método utilizado para as descobertas científicas e avanços/evoluções tecnológicas.'},
    {name: 'Sistema de Arquivos', icon: 'far fa-file-alt', description: 'Básico de Informática (operador de micro); O que são e como funcionam os sistemas de arquivos e diretórios e COMANDOS BÁSICOS no TERMINAL.'},
    {name: 'Design Produto (UX)', icon: 'fad fa-drafting-compass', description: 'O que é, como funciona, qual é o processo e como ter ideias e projetos iniciais de design de produtos digitais (ebook, app, web...) ou físicos (IoT).'},
    {name: 'Docker vs Local', icon: 'fab fa-docker', description: 'O que é, como funciona e qual é o processo para instalar o que é necessário para trabalhar seja LOCAL ou DOCKER e/ou Cloud (Google Colab, infraestrutura na núvem e etc).'},
    {name: 'Como Evoluir (CBL)', icon: 'far fa-seedling', description: 'O que é, como funciona e qual é o processo para evoluir. Como funciona o processo do CBL da Apple para aprender mais e mais rápido. Pare de ser influenciado e seja racional com tudo que você assiste.'}
  ],
  # Financial Edu --> {name: 'Edu Financial', icon: 'fal fa-trophy-alt', description: 'Como pensar e agir de forma a ter eficiência financeira, como se tornar rico mesmo começando com pouco ou nenhum dinheiro.'},
  [
    {name: '', icon: '', description: '', video_id: '', playlist_id: ''},
  ],
  # StartUps
  [
    {name: 'Potencial e Objetivo', icon: 'fal fa-head-side-brain', description: 'Qual é o objetivo do curso, qual é o potencial de transformação da criação de Startups e negócios na sua vida.'},
    {name: 'Criatividade (negócios)', icon: 'fal fa-head-side-brain', description: 'Meios e métodos para ser mais criativo com técnicas como o Ócio Produtivo e comunicação e a Comunicação Seletiva.'},
    {name: 'Ideação', icon: 'fal fa-lightbulb-dollar', description: 'O que é, como funciona e qual é o processo de Ideação de novos negócios. Processos criativos para conceber novos projetos tecnológicos e negócios levando em consideração as demandas dos negócios.'},
    {name: 'Problemas', icon: 'fal fa-times-octagon', description: 'Como descobrir problemas que podem necessitar de soluções e como tornar essas propostas de soluções em modelos economicamente sustentáveis e lucrativos e por fim como descrever o problema no formato de negócios com dados e estatísticas.'},
    {name: 'Soluções', icon: 'fal fa-house-user', description: 'Como propôr solução e como descrever a solução proposta e formas de apresentar a solução: Vídeo, PowerPoints (PitchDeck), Diagramas, Infográficos e etc.'},
    {name: 'Proposta de Valor', icon: 'fal fa-hands-heart', description: 'O que é, como definir e como propôr uma proposta de valor. VALOR vs PREÇO. Dores e Medos vs Ambições e Prazeres.'},
    {name: 'Métricas', icon: 'fal fa-analytics', description: 'Como mensurar resultados, potencial de mercado, potencial de lucro, acompanhamento de qualidade e outras métricas de sucesso do cliente e do negócio.'},
    {name: 'Público-alvo', icon: 'fal fa-bullseye-arrow', description: 'O que é, como funciona e para que serve o público-alvo. Como definir o melhor público para cada momento do projeto. Como validar o público com as primeiras compras e validar o market fit.'},
    {name: 'Receita', icon: 'fal fa-badge-dollar', description: 'O que é e como definir e validar o potencial de mercado, o potencial do negócio proposto, como definir preço, como validar ofertas.'},
    {name: 'Custos', icon: 'fal fa-conveyor-belt-alt'},
    {name: 'Investimento', icon: 'fal fa-comments-dollar'},
    {name: 'Primeiro Robô (CBL)', icon: 'fal fa-dizzy'}
  ],
  # Programming
  [
    {name: 'Versionamento', icon: 'fab fa-git'},
    {name: 'Gerenciadores de Dependência', icon: 'fal fa-cubes'},
    {name: 'Linguagem e Bloco de Programação (hypes)', icon: 'fas fa-terminal'},
    {name: 'Lógica de Programação', icon: 'fal fa-head-side-brain'},
    {name: 'Estrutura de Dados', icon: 'fal fa-server'},
    {name: 'Paradigmas de Programação', icon: 'far fa-project-diagram'},
    {name: 'Banco de Dados', icon: 'fal fa-database'},
    {name: 'Protocolos de Comunicação (APIs)', icon: 'fal fa-chart-network'},
    {name: 'Frameworks (MVC+)', icon: 'fal fa-server'},
    {name: 'Web (backend)', icon: 'fal fa-brackets-curly'},
    {name: 'Web (frontend)', icon: 'fal fa-code'},
    {name: 'App (Android+iPhone)', icon: 'fal fa-mobile'},
    {name: 'Boas práticas', icon: 'fal fa-check-double'},
    {name: 'Deploy - no ar (BaaS/PaaS/IaaS)', icon: 'fal fa-upload'},
    {name: 'CRUD+API+App (CBL)', icon: 'fal fa-dizzy'}
  ],
  # Data Science
  [
    {name: 'Ciência vs Cientificismo', icon: 'fal fa-vials'}, {name: 'Estatística & Negócios', icon: 'fal fa-chart-scatter'},
    {name: 'Comunidade', icon: 'fal fa-user-friends'}, {name: 'Inteligência Artificial', icon: 'fal fa-head-side-brain'},
    {name: 'Negócio (CRISP-0)', icon: 'fal fa-briefcase'}, {name: 'Dados (CRISP-1)', icon: 'fal fa-database'},
    {name: 'Preparação (CRISP-2)', icon: 'fal fa-server'}, {name: 'Algorithm (CRISP-3)', icon: 'fal fa-share-alt'},
    {name: 'Modelo (CRISP-3)', icon: 'fad fa-stream'}, {name: 'Avaliação (CRISP-4)', icon: 'fal fa-check-double'},
    {name: 'CRISP DM (CBL)', icon: 'fal fa-dizzy'}
  ],
  # Digital Marketing & Entrepreneurship
  [
    {name: 'Estratégia', icon: 'fal fa-chess-king'}, {name: 'Criativos', icon: 'fal fa-magic'},
    {name: 'Público', icon: 'fas fa-bullseye-pointer'}, {name: 'Anúncios', icon: 'fal fa-comment-alt-dollar'},
    {name: 'E-mail Marketing', icon: 'fal fa-envelope-open-dollar'}, {name: 'KPIs', icon: 'fal fa-analytics'},
    {name: 'Otimização (Ads)', icon: 'fal fa-funnel-dollar'}, {name: 'Gatilhos Mentais', icon: 'fal fa-head-side-brain'},
    {name: 'Página de Venda', icon: 'fal fa-plane-arrival'}, {name: 'Primeira Venda (CBL)', icon: 'fal fa-dizzy'}
  ],
  # IoT
  [
    {name: 'Arduino', icon: 'fal fa-microchip'}, {name: 'Embarcados', icon: 'fas fa-code'},
    {name: 'Circuitos eletrônicos', icon: 'fal fa-chart-network'}, {name: 'Protoboard', icon: 'far fa-keyboard'},
    {name: 'Sensores', icon: 'fal fa-sensor-fire'}, {name: 'Motores', icon: 'fal fa-conveyor-belt-alt'},
    {name: 'Primeiro Robô (CBL)', icon: 'fal fa-dizzy'}
  ],
  # CBL
  [
    {name: 'WhatsApp', icon: 'fab fa-whatsapp'}, {name: 'Anúncios captar investidores', icon: 'fas fa-bullhorn'},
    {name: 'IA - Reconhecer Voz', icon: 'fal fa-microphone-alt'}, {name: '1º Jogo', icon: 'fal fa-gamepad-alt'}
  ]
]
course.periods.order('id asc').each_with_index do |period, i|
  lessons[i].each_with_index do |lesson, ii|
    lesson[:sort_position] = ii
    period.lessons << Lesson.find_or_create_by(lesson)
  end
end
puts '...Courses inserted.'.colorize(:light_blue)
# /Courses

# Experiences / Job Relationships
# TODO
puts 'Inserting Courses...'.colorize(:green)
# experiences = []
# experiences.each {|e| Experience.crete name: e}
puts '...Courses inserted.'.colorize(:light_blue)
# /Experiences