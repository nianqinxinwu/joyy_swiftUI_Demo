//
//  CourseList.swift
//  JoyySwiftUI
//
//  Created by 常远 on 2021/11/1.
//

import SwiftUI

struct CourseList: View {
    @State var courses = courseData
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Courses")
                    .font(.largeTitle).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                    .padding(.top, 30)
                
                ForEach(courses.indices, id: \.self) { index in
                    GeometryReader { geometry in
                        CourseView(show: self.$courses[index].show, course: courses[index])
                            .offset(y: self.courses[index].show ? -geometry.frame(in:.global).minY : 0)
                    }
//                    .frame(height: self.courses[index].show ? screen.height : 280)
                    .frame(height: 280)
                .frame(maxWidth: self.courses[index].show ? .infinity : screen.width - 60)
                }
            }
            .frame(width: screen.width)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @Binding var show: Bool
    var course: Course
    let viewMaxHeight = 460.0
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 30.0) {
                Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                
                Text("About this course")
                    .font(.title).bold()
                
                Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. while it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but workflows for building great user interfaces and interactions.")
                
                Text("Minimal coding experience required, such as in HTML and CSS. Please note that Xcode 11 and Catalina are essential. Once you get everything installed, it'll get a lot frindlier! I added a bunch of troubleshoots at the end of this page to help you navigate the issues you might encounter.")
            }
            .padding(30)
            .frame(maxWidth: course.show ? .infinity : screen.width - 60, maxHeight: course.show ? .infinity : 280)
            .offset(y: course.show ? viewMaxHeight : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(course.show ? 1 : 0)
            
            VStack() {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(course.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Text(course.subtitle)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    Spacer()
                    ZStack {
                        Image(course.logo)
                            .opacity(course.show ? 0 : 1)
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(course.show ? 1 : 0)
                        
                    }
                }
                Spacer()
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
            }
            .padding(course.show ? 30 : 20)
            .padding(.top, course.show ? 30 : 0)
    
            .frame(maxWidth: course.show ? .infinity : screen.width - 60, maxHeight: course.show ? viewMaxHeight : 280)
            .background(course.color)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: course.color.opacity(0.3), radius: 20, x: 0, y: 20)
            .onTapGesture {
                self.show.toggle()
            }
        }
        .frame(height: show ? screen.height: 280)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
    }
        
}

let screen = UIScreen.main.bounds

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: String
    var logo: String
    var color: Color
    var show: Bool
    var btitle: String
    var bsubtitle: String
    var bcontent: String
}

var courseData = [
    Course(title: "Prototype Designs in SwiftUI", subtitle: "18 Sections", image: "Illustration1", logo: "Logo1", color: Color.red, show: false, btitle: "", bsubtitle: "", bcontent: ""),
    Course(title: "SwiftUI Advanced", subtitle: "20 Sections", image: "Illustration2", logo: "Logo2", color: Color.orange, show: false, btitle: "", bsubtitle: "", bcontent: ""),
    Course(title: "UI Design for Developers", subtitle: "28 Sections", image: "Illustration3", logo: "Logo1", color: Color.yellow, show: false, btitle: "", bsubtitle: "", bcontent: ""),
]
