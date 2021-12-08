# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ROLES: admin
puts 'Inserting Roles...'.colorize(:green)
admin_role = Role.find_or_create_by name: 'admin', title: 'System Admin', description: 'Este usuário tem permissão completa sobre o sistema.'
publisher_role = Role.find_or_create_by name: 'publisher', title: 'Publisher of Content (seller)', description: 'Este usuário tem permissão para publicar itens a venda.'
buyer_role = Role.find_or_create_by name: 'buyer', title: 'Buyer of Content', description: 'Este usuário tem permissão para consultar os itens a venda'
affiliate_role = Role.find_or_create_by name: 'affiliate', title: 'Affiliate of Content', description: 'Este usuário tem permissão dos conteúdos a ser afiliado'
puts '...Roles inserted.'.colorize(:light_blue)
# /ROLES

# Creates Root Admin user
# INITIAL USER & PROFILE
puts 'Inserting Admin & other users...'.colorize(:green)
u_admin = User.where(email: 'admin@kpihunters.com').take
if u_admin.nil?
  admin = User.new full_name: 'Hot Admin', email: 'admin@kpihunters.com', role_id: admin_role.id,
                   password: Faker::Internet.password(max_length: 10), admin: true
  admin.skip_confirmation!
  admin.save

  Profile.new phone: Faker::PhoneNumber.cell_phone, state_ibge: '53', county_ibge: '5300108', user_id: admin.id,
               full_address: Faker::Address.full_address, zip_code: Faker::Address.zip_code,
               company_fantasy_name: 'KPI Hunters', website: 'https://kpihunters.com',
               gov_id_pf: CPF.generate, gov_id_pj: '32282065000163',
               company_legal_name: 'KPI Hunters Marketing & Tecnologia Ltda',
               bio: 'Eu encontro a melhor opção tecnológica com o mínimo de esforço e custo para aplicá-las nos mais complexos cenários e obter as soluções mais simples e barata para atingir os resultados esperados de ganhos para o meu cliente e o cliente do meu cliente. Eu sou alguém que toma decisões baseado em dados (data driven). Além disso, sempre considero as duas possibilidades que existem (a otimista e a pessimista) analisando seus argumentos de forma que o risco seja sempre gerenciado com operações contrárias ao cenário projetado criando seguros. Nunca escolho lados, uno os pontos positivos de cada um dos dois e ajudo a manejar o lado negativo de ambos, pois a liderança não deve escolher lados, deve conseguir unir lados criando apenas um. Amo empreender e ajudar outras pessoas a conquistarem seus objetivos e mudarem suas vidas. Amo estar com minha família, curtir a natureza e viajar.'

  user1 = User.new full_name: 'Ilton Professor', email: 'ilton.publisher@gmail.com',
                   password: Faker::Internet.password(max_length: 10), role_id: publisher_role.id
  user1.skip_confirmation!
  user1.save

  user2 = User.new full_name: 'Ilton Aluno', email: 'ilton.buyer@gmail.com',
                   password: Faker::Internet.password(max_length: 10), role_id: buyer_role.id
  user2.skip_confirmation!
  user2.save
  p2 = Profile.new phone: Faker::PhoneNumber.cell_phone, gov_id_pf: CPF.generate, user_id: user2.id,
                   state_ibge: '53', county_ibge: '5300108', website: 'https://kpihunters.com',
                   full_address: Faker::Address.full_address, zip_code: Faker::Address.zip_code,
                   bio: 'engenheiro de software; engenheiro de dados; cientista de dados; empreendedor; pesquisador em saúde; engenharia biomédica; desenvolvedor full stack; agrotech; meio ambiente; cooperação internacional'
  p2.user = user2
  p2.save
end
puts '...AdminUser & other users inserted.'.colorize(:light_blue)
# /INITIAL USER & PROFILE

# Initial Apps
puts 'Inserting apps...'
intro_video = 'https://www.youtube.com/embed/v9p9trnQIL8'
local_ct_app = App.find_or_create_by name: 'Cidadania Tech', domain: 'localhost:8000',
                                     user_id: admin.id, intro_video: intro_video
prod_ct_app = App.find_or_create_by name: 'Cidadania Tech',
                                    domain: 'cidadaniatech.kpihunters.com', user_id: admin.id
puts '...Initial apps inserted'
# /Initial Apps

# Create Courses IT
# COURSES
puts 'Inserting Courses...'.colorize(:green)
it_course = Course.find_or_create_by(name: 'KPI Hunters - Full Stack STARTUP', description: 'Desenvolvimento de sistemas e aplicativos e negócios')
if it_course.periods.empty?
  periods = [
    { name: 'Comece aqui!', icon: 'fal fa-book-reader' },
    { name: 'Ambiente', icon: 'fal fa-laptop' },
    { name: 'Interface Gráfica', icon: 'fal fa-object-group' },
    { name: 'Lógica de Código', icon: 'fal fa-project-diagram' },
    { name: 'Orientação a Objeto', icon: 'fal fa-users-class' },
    { name: 'Banco de Dados', icon: 'fal fa-database' },
    { name: 'Frameworks', icon: 'far fa-campfire' }
  ]
  periods.each_with_index do |period, i|
    period[:sort_position] = i
    it_course.periods << Period.find_or_create_by(period)
  end

  lessons = [
    # Pre-Course (about roadmap & start)
    [
      { name: '(Slack) Comunidade', icon: 'fab fa-slack', description: 'Descubra como utilizar nossa comunidade para tirar o maior proveito do curso', video_id: 'BPbCLtBl_g4'},
      { name: '(LinkedIn) Revisão do perfil', icon: 'fab fa-linkedin-in', description: 'Tenha um perfil irresistível no LinkedIn e SEJA ACHADO ao invés de caçar vagas', video_id: 'BPbCLtBl_g4'},
      { name: '(GitHub) Revisão do perfil', icon: 'fab fa-github', description: 'Tenha um portfólio que mostra seu potencial e os projetos nos quais você tem trabalhado', video_id: 'BPbCLtBl_g4'},
      { name: '(plataformas) Revisão do perfil', icon: 'fal fa-address-card', description: 'Revisão dos perfis em plataformas de emprego para receber vagas adequadas', video_id: 'BPbCLtBl_g4'},
      { name: 'KPI TaaS', icon: 'fal fa-drafting-compass', description: 'O que é o Talento como Serviço (Talent as a Service) e como isso vai aumentar suas chances de ter o primeiro emprego.' },
      { name: 'Vida de Programador', icon: 'fal fa-house-leave', description: 'Como funciona o trabalho na área de tecnologia e em empresas modernas e ágeis; Como é e o que é o SCRUM, Kanban, Lean Stratup; Como será o trabalho nos projetos da KPI Hunters, seus parceiros e demais empresas.' },
      { name: 'Backend vs Frontend', icon: 'fal fa-bring-front', description: 'Qual a diferença entre o trabalho do frontend e do backend e como funciona o trabalho das partes.' },
      { name: 'Design (UI/UX)', icon: 'fal fa-drafting-compass', description: 'O que é, como funciona, qual é o processo e como ter ideias e projetos iniciais de design de produtos (app, web...).' },
      { name: 'Desafio', icon: 'fal fa-volcano', description: 'Desafio do pré-curso para validar se você compreendeu o funcionamento do curso' }
    ],
    # Environment Preparation
    [
      { name: 'Uso do computador', icon: 'fal fa-phone-laptop', description: 'Como configurar e utilizar o computador. Diferença entre Sistemas Operacionais, Sistema de Arquivos, HD (ROM) vs Memória (RAM), pastas, arquivos e aplicativos).', video_id: 'BPbCLtBl_g4' },
      { name: 'Linux no Windows', icon: 'fal fa-laptop-code', description: 'Como configurar e utilizar o linux no windows e o Gitbash e mostrar a diferença entre GitBash, WSL e Prompt.', video_id: 'BPbCLtBl_g4' },
      { name: 'Operador avançado', icon: 'fal fa-terminal', description: 'UI vs Terminal: comandos básicos e o reflexo do comando na UI e vice-versa e lista de comandos a serem usados.' },
      { name: 'Docker vs Local', icon: 'fab fa-docker', description: 'O que é, como funciona e qual é o processo para instalar o que é necessário para trabalhar seja LOCAL ou no DOCKER (https://labs.play-with-docker.com/) e/ou Cloud (Google Colab, infraestrutura na núvem e etc).' },
      { name: 'Programar no Celular', icon: 'fal fa-mobile-android', description: 'Adaptando máquinas de baixo poder computacional (celular ou computador) para minimamente conseguir aprender a programar.' },
      { name: 'Git', icon: 'fab fa-git', description: 'Todos os passos necessários para você manter o seu código e inclusive o seu aprendizado' },
      { name: 'Desafio', icon: 'fal fa-volcano', description: 'Desafio para verificar se você conseguiu preparar seu ambiente corretamente' }
    ],
    # UI
    [
      { name: 'Todas UI em 1', icon: 'fal fa-object-group', description: 'Todas as formas de criar telas em apenas 1 vídeo (Android, iOS, Web & Desktop)', video_id: 'BPbCLtBl_g4' },
      { name: 'HTML / XML', icon: 'fal fa-file-code', description: 'Criação de telas em HTML (web/híbrido) ou Android Nativo (XML). Tudo é sempre a mesma coisa!', video_id: 'BPbCLtBl_g4' },
      { name: 'CSS / XML', icon: 'fab fa-css3', description: 'Estilização de telas em CSS (web/híbrido) ou Android Nativo (XML). Tudo é sempre a mesma coisa!', video_id: 'BPbCLtBl_g4' },
      { name: 'JavaScript', icon: 'fab fa-js-square', description: 'Tornando as telas estáticas em telas dinâmicas e interativas', video_id: 'BPbCLtBl_g4' },
      { name: 'Frameworks de JS Front', icon: 'far fa-campfire', description: 'Frameworks para facilitar o desenvolvimento das interações e o dinamismo do sistema', video_id: 'BPbCLtBl_g4' },
      { name: 'Telas (Portfólio)', icon: 'fal fa-columns', description: 'Uso de temas para facilitar o processo de desenvolvimento de UI', video_id: 'BPbCLtBl_g4' },
      { name: 'Desafio', icon: 'fal fa-volcano', description: 'Desafio para verificar se você conseguiu criar as telas corretamente' }
    ],
    # Programming Logic
    [
      { name: 'Pensamento Estruturado (UML)', icon: 'fal fa-project-diagram', description: 'Pensamento lógico e estruturado do dia-a-dia em diagramas (UML). Você também verá a importância deste trabalho e o significado de KPI', video_id: 'BPbCLtBl_g4' },
      { name: 'Variáveis vs Constantes', icon: 'fad fa-angle-double-up', description: 'Funcionamento e seus Tipos. Tudo na TI é uma função, inclusive a criação e o preenchimento de Variáveis e Constantes. Estes dois tipos de armazenamento de informação são a menor abstração.', video_id: 'BPbCLtBl_g4' },
      { name: 'Matemática Computacional', icon: 'fal fa-calculator-alt', description: 'Tudo em TI é uma função. Neste vídeo você verá que tudo sempre é função e como funciona a matemática computacional.', video_id: 'BPbCLtBl_g4' },
      { name: 'Operadores Lógicos', icon: 'fal fa-sort-alt', description: 'Lógica clássica e lógica booleana além dos operadores utilizados para traduzir a lógica para a linguagem computacional', video_id: 'BPbCLtBl_g4' },
      { name: 'Seleção e Repetição', icon: 'fal fa-code-branch', description: 'Blocos de códigos que fazem a seleção (IF+ELSE/SWITCH) e blocos de códigos que repetem o bloco (loop)', video_id: 'BPbCLtBl_g4' },
      { name: 'Funções', icon: 'fal fa-function', description: 'Blocos de código que criam funções a serem reutilizados para obter o valor de um processamento a ser repetido em diversos locais do código', video_id: 'BPbCLtBl_g4' },
      { name: 'Estrutura de Dados', icon: 'fal fa-album-collection', description: 'Estruturas de armazenamento de dados (array, lista, fila e dicionário). Basicamente apenas array e dicionário são de fato amplamento usados', video_id: 'BPbCLtBl_g4' },
      { name: 'Desafio', icon: 'fal fa-volcano', description: 'Desafio para verificar se você conseguiu entender a lógica de programação' }
    ],
    # Object Oriented
    [
      { name: 'Classes e Métodos', icon: 'fal fa-users-class', description: 'Pensamento lógico e estruturado do dia-a-dia em diagramas (UML). Você também verá a importância deste trabalho e o significado de KPI', video_id: 'BPbCLtBl_g4' },
      { name: 'Objetos vs Dicionário', icon: 'fal fa-object-ungroup', description: 'Pensamento lógico e estruturado do dia-a-dia em diagramas (UML). Você também verá a importância deste trabalho e o significado de KPI', video_id: 'BPbCLtBl_g4' },
      { name: 'Herança e Polimorfismo', icon: 'fal fa-sitemap', description: 'Pensamento lógico e estruturado do dia-a-dia em diagramas (UML). Você também verá a importância deste trabalho e o significado de KPI', video_id: 'BPbCLtBl_g4' },
      { name: 'DRY e SOLID', icon: 'fal fa-users-slash', description: 'Pensamento lógico e estruturado do dia-a-dia em diagramas (UML). Você também verá a importância deste trabalho e o significado de KPI', video_id: 'BPbCLtBl_g4' },
      { name: 'Desafio', icon: 'fal fa-volcano', description: 'Desafio para verificar se você conseguiu entender a lógica de programação' }
    ],
    # Database
    [
      { name: 'Conceito de BD', icon: 'fal fa-server', description: 'Descubra o segredo: É TUDO SEMPRE A MESMA COISA!', video_id: 'BPbCLtBl_g4' },
      { name: 'Conceito de serviços', icon: 'fal fa-concierge-bell', description: 'Descubra o segredo: É TUDO SEMPRE A MESMA COISA!', video_id: 'BPbCLtBl_g4' },
      { name: 'MER', icon: 'fal fa-project-diagram', description: 'Descubra o segredo: É TUDO SEMPRE A MESMA COISA!', video_id: 'BPbCLtBl_g4' },
      { name: 'Instalação SGBDs', icon: 'fal fa-download', description: 'Descubra o segredo: É TUDO SEMPRE A MESMA COISA!', video_id: 'BPbCLtBl_g4' },
      { name: 'Dump & Importação', icon: 'fal fa-sync-alt', description: 'Descubra o segredo: É TUDO SEMPRE A MESMA COISA!', video_id: 'BPbCLtBl_g4' },
      { name: 'SQLs', icon: 'fab fa-squarespace', description: 'Descubra o segredo: É TUDO SEMPRE A MESMA COISA!', video_id: 'BPbCLtBl_g4' },
      { name: 'Desafio', icon: 'fal fa-volcano', description: 'Desafio para verificar se você conseguiu entender o funcionamento e a gestão de banco de dados' }
    ],
    # Frameworks
    [
      { name: 'Linguagens de Programação', icon: 'fal fa-language', description: 'Descubra o segredo: É TUDO SEMPRE A MESMA COISA!', video_id: 'BPbCLtBl_g4' },
      { name: 'Gestão de Versão (CBL)', icon: 'fal fa-code-merge', description: 'Aprenda a versionar o interpretador/compilador da linguagem de programação (brew, apt...)', video_id: 'BPbCLtBl_g4' },
      { name: 'Frameworks', icon: 'far fa-campfire', description: 'Aprenda o que é e como utilizar frameworks (códigos e estruturas prontas que agilizam o trabalho)', video_id: 'BPbCLtBl_g4' },
      { name: 'Gestão de Dependências (CBL)', icon: 'fal fa-sitemap', description: 'Aprenda a versionar as dependências de frameworks do projeto', video_id: 'BPbCLtBl_g4' },
      { name: 'Arquiteturas (MVC)', icon: 'fal fa-layer-group', description: 'Aprenda a principal arquitetura da grande maioria dos frameworks', video_id: 'BPbCLtBl_g4' },
      { name: 'Desafio', icon: 'fal fa-volcano', description: 'Desafio para verificar se você conseguiu entender como funcionam os frameworks e se consegue aplicar' }
    ]
  ]
  it_course.periods.order('id asc').each_with_index do |period, i|
    lessons[i].each_with_index do |lesson, ii|
      lesson[:sort_position] = ii
      period.lessons << Lesson.find_or_create_by(lesson)
    end
  end

  CrossApp.find_or_create_by name: 'Prod Course', course_id: it_course.id, app_id: prod_ct_app.id
  CrossApp.find_or_create_by name: 'Local Course', course_id: it_course.id, app_id: local_ct_app.id
end
puts '...Courses inserted.'.colorize(:light_blue)
# /Courses IT

# AdminCourse
puts 'Inserting AdminCourse...'.colorize(:green)
AdminCourse.find_or_create_by(admin: true, user_id: user1.id, course_id: it_course.id) if u_admin.nil? && !user1.nil?
puts '...AdminCourse inserted.'.colorize(:light_blue)
# /AdminCourse
