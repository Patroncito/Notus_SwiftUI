//
//  NotesViewModel.swift
//  Notes
//
//  Created by Alfonso Patron on 16/01/24.
//

import Foundation

class NotesViewModel: ObservableObject {
    
    @Published var notes = [Note]()
    var urlAPI = "https://nodejs-restapi-notes-production.up.railway.app/api/notes"

    
    //MARK: GET ALL NOTES
    
  
    
    
    func fetchNotes() async {
        guard let url = URL(string: urlAPI) else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([Note].self, from: data) {
                DispatchQueue.main.async {
                    self.notes = decodedResponse
                }
            }
        } catch {
            print("Fetch failed: \(error.localizedDescription)")
        }
    }
    
    
    //MARK: POST NOTES
    
    
    func addNote(_ newNote : Note_POST) async {
        guard let url = URL(string: urlAPI) else { return }

        do {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            //let note = Note_POST(name: name, tasktext: tasktext)
            request.httpBody = try JSONEncoder().encode(newNote)

            let (data, response) = try await URLSession.shared.data(for: request)

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let decodedResponse = try JSONDecoder().decode(Note.self, from: data)

                DispatchQueue.main.async {
                    self.notes.append(decodedResponse)
                }
            }
        } catch {
            print("POST request failed: \(error.localizedDescription)")
        }
    }

    
    
    
    //MARK: DELETE NOTE
    
    
    func deleteNoteById(id: Int) async {
           guard let url = URL(string: "https://nodejs-restapi-notes-production.up.railway.app/api/notes/\(id)") else { return }

           do {
               var request = URLRequest(url: url)
               request.httpMethod = "DELETE"

               let (_, response) = try await URLSession.shared.data(for: request)

               if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                   // Eliminar la nota de la lista local
                   DispatchQueue.main.async {
                       self.notes.removeAll { $0.id == id }
                   }
               }
           } catch {
               print("DELETE request failed: \(error.localizedDescription)")
           }
       }
    
    /* func deleteNoteById(id: Int) {
        guard let url = URL(string: "https://nodejs-restapi-notes-production.up.railway.app/api/notes/\(id)") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error occurred: \(error.localizedDescription)")
                return
            }

            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                print("Server error with response code: \(response.statusCode)")
                return
            }

            // Remove the note from the local array
            if let index = self.notes.firstIndex(where: { $0.id == id }) {
                DispatchQueue.main.async {
                    self.notes.remove(at: index)
                }
            }
        }.resume()
    }
     
     
     */

    
    
    
    
    
}
