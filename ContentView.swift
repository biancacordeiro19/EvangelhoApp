import SwiftUI

struct Tela01: View {
    @State private var username: String = "João da Silva"
    @State private var email: String = "joao.silva@email.com"
    @State private var showMenu: Bool = false // Controla a exibição do menu

    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 30) {
                    HStack {
                        Button(action: {
                            showMenu.toggle() // Alterna o menu
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .font(.title)
                                .foregroundColor(.purple)
                        }
                        Spacer()
                    }
                    .padding(.leading)

                    Text("Bem-vindo!")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)

                    Text("Fortaleça sua fé e encontre esperança em cada passo com Cristo.")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    HStack(spacing: 20) {
                        NavigationLink(destination: ContentView()) {
                            OptionCard(title: "Evangelho do Dia", color: .blue, iconName: "book")
                        }

                        NavigationLink(destination: PerguntasView()) {
                            OptionCard(title: "Perguntas", color: .green, iconName: "questionmark.circle")
                        }
                    }

                    HStack(spacing: 20) {
                        NavigationLink(destination: configuracaoView()) {
                            OptionCard(title: "Configurações", color: .yellow, iconName: "gear")
                        }

                        NavigationLink(destination: LoginView()) {
                            OptionCard(title: "Sair", color: .red, iconName: "arrow.right.square")
                        }
                    }

                    Spacer()
                }
                .padding()

                // Menu Lateral
                if showMenu {
                    MenuView(username: username, email: email, onDismiss: {
                        showMenu = false // Fecha o menu ao clicar fora
                    })
                }
            }
        }
    }
}

// Componente do Menu Lateral
struct MenuView: View {
    var username: String
    var email: String
    var onDismiss: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // Imagem do Perfil
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.purple)

                VStack(alignment: .leading) {
                    Text(username)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(email)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.leading, 10)
            }
            .padding()

            Divider()

            // Opções do Menu
            VStack(alignment: .leading, spacing: 15) {
                Button(action: {
                    // Navega para Evangelho do Dia
                }) {
                    HStack {
                        Image(systemName: "book")
                            .foregroundColor(.blue)
                        Text("Evangelho do Dia")
                    }
                }

                Button(action: {
                    // Navega para Perguntas
                }) {
                    HStack {
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(.green)
                        Text("Perguntas")
                    }
                }

                Button(action: {
                    // Navega para Configurações
                }) {
                    HStack {
                        Image(systemName: "gear")
                            .foregroundColor(.yellow)
                        Text("Configurações")
                    }
                }

                Button(action: {
                    // Ação de Sair
                }) {
                    HStack {
                        Image(systemName: "arrow.right.square")
                            .foregroundColor(.red)
                        Text("Sair")
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)

            Spacer()
        }
        .frame(maxWidth: 300)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
        .onTapGesture {
            onDismiss()
        }
        .padding(.leading, 10)
    }
}

struct OptionCard: View {
    let title: String
    let color: Color
    let iconName: String

    var body: some View {
        VStack {
            Image(systemName: iconName)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .padding()

            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(color)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

struct contentView: View {
    var body: some View {
        VStack {
            Text("Evangelho do Dia")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
    }
}

struct ConfiguracaoView: View {
    var body: some View {
        VStack {
            Text("Configurações")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
    }
}

struct perguntasView: View {
    var body: some View {
        VStack {
            Text("Perguntas")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
    }
}

struct loginView: View {
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
    }
}

struct perguntas: View {
    @State private var userAnswer: String = ""
    @State private var submittedAnswer: String? = nil

    var body: some View {
        VStack(spacing: 20) {
            Text("Como viver o Evangelho?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding()

            TextEditor(text: $userAnswer)
                .padding()
                .frame(height: 150)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.brown, lineWidth: 1)
                )
                .autocapitalization(.sentences)

            Button(action: submitAnswer) {
                Text("Enviar Resposta")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.brown)
                    .cornerRadius(8)
            }

            if let answer = submittedAnswer {
                Text("Sua Resposta:")
                    .font(.headline)
                    .foregroundColor(.brown)
                    .padding(.top)

                Text(answer)
                    .font(.body)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Perguntas")
        .background(Color(red: 0.95, green: 0.88, blue: 0.76))
    }

    private func submitAnswer() {
        if userAnswer.isEmpty {
            submittedAnswer = "Por favor, insira uma resposta antes de enviar."
        } else {
            submittedAnswer = userAnswer
            userAnswer = ""
        }
    }
}
struct Tela01_Previews: PreviewProvider {
    static var previews: some View {
        Tela01()
    }
}
